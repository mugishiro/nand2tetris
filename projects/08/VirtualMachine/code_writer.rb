class CodeWriter
  attr_accessor :input_path

  def initialize(output_path)
    @output = File.open(output_path, "w")
    @local_label_count = 0
    @current_function_name = "."
    @input_path = nil
  end

  def write_init
    write init_asm
  end

  def write_arithmetic(command)
    write math_asm(command)
  end

  def write_push_pop(command, segment, index)
    case command
    when :c_push then write push_asm(segment, index)
    when :c_pop then write pop_asm(segment, index)
    end
  end

  def write_label(label)
    write "(#{label_specification(label)})"
  end

  def write_goto(label)
    write goto_asm(label)
  end

  def write_if(label)
    write if_asm(label)
  end

  def write_function(name, arg_count)
    @current_function_name = name
    write function_asm(name, arg_count)
  end

  def write_return
    write return_asm
  end

  def write_call(name, arg_count)
    write call_asm(name, arg_count)
  end

  private

  def write(asm)
    @output.puts asm
    @output.puts
  end

  def init_asm
    <<~ASM
      @256 //// init
      D=A
      @SP
      M=D
      // call Sys.init
      #{call_asm("Sys.init", 0)}
    ASM
  end

  def call_asm(name, arg_count)
    return_address = next_local_label
    <<~ASM
      #{push_d_register_asm("#{return_address}", "A")}
      #{push_d_register_asm("LCL", "M")}
      #{push_d_register_asm("ARG", "M")}
      #{push_d_register_asm("THIS", "M")}
      #{push_d_register_asm("THAT", "M")}
      @SP // ARG=SP-n-5
      D=M
      @#{arg_count}
      D=D-A
      @5
      D=D-A
      @ARG
      M=D
      @SP // LCL=SP
      D=M
      @LCL
      M=D
      @#{name} // goto #{name}
      0;JMP
      (#{return_address}) // return-address
    ASM
  end

  def return_asm
    <<~ASM
      @LCL //// return
      D=M // FRAME=LCL
      @R13
      M=D
      @5 // RET=*(FRAME-5)
      A=D-A
      D=M
      @R14
      M=D
      @SP // *ARG=pop()
      M=M-1
      A=M
      D=M
      @ARG
      A=M
      M=D
      @ARG // SP=ARG+1
      D=M+1
      @SP
      M=D
      #{return_frame_asm(1, "THAT")}
      #{return_frame_asm(2, "THIS")}
      #{return_frame_asm(3, "ARG")}
      #{return_frame_asm(4, "LCL")}
      @R14 // goto RET
      A=M
      0;JMP
    ASM
  end

  def return_frame_asm(address, segment)
    <<~ASM
      @#{address} // #{segment}=*(FRAME-#{address})
      D=A
      @R13
      A=M-D
      D=M
      @#{segment}
      M=D
    ASM
  end

  def push_d_register_asm(address = "0", offset_calculation = "A")
    <<~ASM
      @#{address} // push #{address}
      D=#{offset_calculation}
      @SP // push d_register
      A=M
      M=D
      @SP
      M=M+1
    ASM
  end

  def function_asm(name, arg_count)
    asm = "(#{name}) //// function #{name}\n"
    arg_count.times do
      asm << push_d_register_asm
    end
    asm
  end

  def if_asm(label)
    <<~ASM
      @SP //// if_goto #{label}
      M=M-1
      A=M
      D=M
      @#{label_specification(label)}
      D;JNE
    ASM
  end

  def goto_asm(label)
    <<~ASM
      @#{label_specification(label)} //// goto #{label}
      0;JMP
    ASM
  end

  def label_specification(label)
    "#{@current_function_name}$#{label}"
  end

  def next_local_label
    @local_label_count += 1
    "$L#{@local_label_count}"
  end

  def segment_symbol(segment, index = 0)
    case segment
    when "local" then "LCL"
    when "argument" then "ARG"
    when "this" then "THIS"
    when "that" then "THAT"
    when "pointer" then "R3"
    when "temp" then "R5"
    when "static" then "#{static_segment_symbol(index)}"
    end
  end

  def static_segment_symbol(index)
    basename = File.basename(input_path, ".vm")
    "#{basename}.#{index}"
  end

  def push_asm(segment, index)
    case segment
    when "constant" then push_constant_asm(index)
    when "pointer", "temp" then push_indirect_asm(segment, index, "D+A")
    when "static" then push_static_asm(index)
    else push_indirect_asm(segment, index, "D+M")
    end
  end

  def pop_asm(segment, index)
    case segment
    when "pointer", "temp" then pop_indirect_asm(segment, index, "D+A")
    when "static" then pop_static_asm(index)
    else pop_indirect_asm(segment, index, "D+M")
    end
  end

  def push_constant_asm(index)
    <<~ASM
      @#{index} //// push constant #{index}
      D=A
      @SP
      A=M
      M=D
      @SP
      M=M+1
    ASM
  end

  def push_static_asm(index)
    <<~ASM
      @#{segment_symbol("static", index)} //// push static #{index}
      D=M
      @SP
      A=M
      M=D
      @SP
      M=M+1
    ASM
  end

  def push_indirect_asm(segment, index, offset_calculation)
    <<~ASM
      @#{index} //// push #{segment} #{index}
      D=A
      @#{segment_symbol(segment)}
      A=#{offset_calculation}
      D=M
      @SP
      A=M
      M=D
      @SP
      M=M+1
    ASM
  end

  def pop_static_asm(index)
    <<~ASM
      @SP //// pop static #{index}
      M=M-1
      A=M
      D=M
      @#{segment_symbol("static", index)}
      M=D
    ASM
  end

  def pop_indirect_asm(segment, index, offset_calculation)
    <<~ASM
      @#{index} //// pop #{segment} #{index}
      D=A
      @#{segment_symbol(segment)}
      D=#{offset_calculation}
      @13
      M=D
      @SP
      M=M-1
      A=M
      D=M
      @13
      A=M
      M=D
    ASM
  end

  def math_asm(command)
    case command
    when "add" then binary_operation_asm(command, "D+M")
    when "sub" then binary_operation_asm(command, "M-D")
    when "and" then binary_operation_asm(command, "D&M")
    when "or" then binary_operation_asm(command, "D|M")

    when "neg" then unary_operation_asm(command, "-M")
    when "not" then unary_operation_asm(command, "!M")

    when "eq" then conditional_asm(command, "JEQ")
    when "gt" then conditional_asm(command, "JGT")
    when "lt" then conditional_asm(command, "JLT")
    else
      fail "Unknown math command: #{command}"
    end
  end

  def binary_operation_asm(command, calculation)
    <<~ASM
      @SP //// #{command}
      M=M-1
      A=M
      D=M
      A=A-1
      M=#{calculation}
    ASM
  end

  def unary_operation_asm(command, calculation)
    <<~ASM
      @SP //// #{command}
      A=M-1
      M=#{calculation}
    ASM
  end

  def conditional_asm(command, jump_condition)
    equal_label = next_local_label
    end_label = next_local_label
    <<~ASM
      @SP //// #{command}
      M=M-1
      A=M
      D=M
      A=A-1
      D=M-D
      @#{equal_label}
      D;#{jump_condition}
      D=0
      @#{end_label}
      0;JMP
      (#{equal_label})
      D=-1
      (#{end_label})
      @SP
      A=M-1
      M=D
    ASM
  end
end
