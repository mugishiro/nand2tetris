class Parser
  attr_reader :current_line, :current_match, :input

  COMMENT_PATTERN = %r{//.*\z}
  SYMBOL_PATTERN = /[A-Za-z\d_\.\$\:]+/
  SEGMENT_PATTERN = /argument|local|static|constant|this|that|pointer|temp/
  ARITHMETIC_PATTERN = /\A(?<command>add|sub|neg|eq|gt|lt|and|or|not)\z/
  PUSH_PATTERN = /\Apush\s*(?<segment>#{SEGMENT_PATTERN})\s*(?<index>\d+)\z/
  POP_PATTERN = /\Apop\s*(?<segment>#{SEGMENT_PATTERN})\s*(?<index>\d+)\z/
  LABEL_PATTERN = /\Alabel\s*(?<symbol>#{SYMBOL_PATTERN})\z/
  GOTO_PATTERN = /\Agoto\s*(?<symbol>#{SYMBOL_PATTERN})\z/
  IF_PATTERN = /\Aif-goto\s*(?<symbol>#{SYMBOL_PATTERN})\z/
  FUNCTION_PATTERN = /\Afunction\s*(?<function_name>#{SYMBOL_PATTERN})\s*(?<n_locals>\d+)\z/
  CALL_PATTERN = /\Acall\s*(?<function_name>#{SYMBOL_PATTERN})\s*(?<n_args>\d+)\z/
  RETURN_PATTERN = /\Areturn\z/

  def initialize(input)
    @input = input
    @current_line = nil
  end

  def has_more_commands?
    !input.eof?
  end

  def advance
    @current_line = input.readline.strip.gsub(COMMENT_PATTERN, "").strip
  end

  def command_type
    return nil if current_line.empty?
    if @current_match = ARITHMETIC_PATTERN.match(current_line)
      return :c_arithmetic
    elsif @current_match = PUSH_PATTERN.match(current_line)
      return :c_push
    elsif @current_match = POP_PATTERN.match(current_line)
      return :c_pop
    elsif @current_match = LABEL_PATTERN.match(current_line)
      return :c_label
    elsif @current_match = GOTO_PATTERN.match(current_line)
      return :c_goto
    elsif @current_match = IF_PATTERN.match(current_line)
      return :c_if
    elsif @current_match = FUNCTION_PATTERN.match(current_line)
      return :c_function
    elsif @current_match = CALL_PATTERN.match(current_line)
      return :c_call
    elsif RETURN_PATTERN.match(current_line)
      return :c_return
    end
  end

  def arg1
    case command_type
    when :c_return
      nil
    when :c_arithmetic
      @current_match[:command]
    when :c_push, :c_pop
      @current_match[:segment]
    when :c_label, :c_goto, :c_if
      @current_match[:symbol]
    when :c_function, :c_call
      @current_match[:function_name]
    end
  end

  def arg2
    case command_type
    when :c_push, :c_pop
      @current_match[:index].to_i
    when :c_function
      @current_match[:n_locals].to_i
    when :c_call
      @current_match[:n_args].to_i
    else
      nil
    end
  end
end
