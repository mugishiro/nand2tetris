class CodeWriter
  attr_accessor :input_path

  def initialize(output_path)
    @output = File.open(output_path, "w")
    @local_label_count = 0
    @input_path = nil
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

  private

  def write(asm)
    @output.puts asm
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
      @#{index} // push constant #{index}
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
      @#{segment_symbol("static", index)} // push static #{index}
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
      @#{index} // push #{segment} #{index}
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
      @SP // pop static #{index}
      M=M-1
      A=M
      D=M
      @#{segment_symbol("static", index)}
      M=D
    ASM
  end

  def pop_indirect_asm(segment, index, offset_calculation)
    <<~ASM
      @#{index} // pop #{segment} #{index}
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
      @SP // #{command}
      M=M-1
      A=M
      D=M
      A=A-1
      M=#{calculation}
    ASM
  end

  def unary_operation_asm(command, calculation)
    <<~ASM
      @SP // #{command}
      A=M-1
      M=#{calculation}
    ASM
  end

  def conditional_asm(command, jump_condition)
    equal_label = next_local_label
    end_label = next_local_label
    <<~ASM
      @SP // #{command}
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
