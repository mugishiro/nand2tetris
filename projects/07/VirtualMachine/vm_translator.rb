require_relative "parser"
require_relative "code_writer"

class VMTranslator
  def translate_file(input_path)
    output_path = input_path.gsub(/.vm\z/i, ".asm")
    code_writer = CodeWriter.new(output_path)
    code_writer.input_path = input_path
    generate(input_path, code_writer)
  end

  def generate(input_path, code_writer)
    input = File.open(input_path, "r")
    parser = Parser.new(input)
    while parser.has_more_commands?
      parser.advance
      case parser.command_type
      when :c_arithmetic
        code_writer.write_arithmetic(parser.arg1)
      when :c_push, :c_pop
        code_writer.write_push_pop(parser.command_type, parser.arg1, parser.arg2)
      when nil

      else
        fail "Unsupported: #{parser.current_line}"
      end
    end
  end
end
