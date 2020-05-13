class Parser
  attr_reader :current_line, :current_match, :input

  DEST_PATTERN = /A|AD|AM|ADM|AMD|D|DA|DM|DAM|DMA|M|MA|MD|MAD|MDA/
  COMP_A0_PATTERN = /0|1|-1|[AD]|\![AD]|-[AD]|[AD]\+1|[AD]-1|D\+A|A-D|D-A|A&D|D&A|D\|A|A\|D/
  COMP_A1_PATTERN = /M|\!M|-M|M\+1|M-1|D\+M|M\+D|D-M|M-D|D&M|M&D|D\|M|M\|D/
  JUMP_PATTERN = /J(GT|EQ|GE|LT|NE|LE|MP)/
  COMMENT_PATTERN = %r{//.*\z}
  CONSTANT_PATTERN = /\A\d+\z/
  SYMBOL_PATTERN = /[A-Za-z\d_\.\$\:]+/
  A_PATTERN = /\A@(?<symbol>#{SYMBOL_PATTERN})\z/
  L_PATTERN = /\A\((?<symbol>#{SYMBOL_PATTERN})\)\z/
  C_PATTERN = /\A((?<dest>#{DEST_PATTERN})\s*=\s*)?((?<comp>(#{COMP_A0_PATTERN})|(#{COMP_A1_PATTERN})))(\s*;\s*(?<jump>#{JUMP_PATTERN}))?\z/

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
    if A_PATTERN.match(current_line)
      @current_match = A_PATTERN.match(current_line)
      return :a_command
    elsif L_PATTERN.match(current_line)
      @current_match = L_PATTERN.match(current_line)
      return :l_command
    elsif C_PATTERN.match(current_line)
      @current_match = C_PATTERN.match(current_line)
      return :c_command
    end
    fail "Cannot parse line: #{current_line}"
  end

  def symbol
    current_match[:symbol]
  end

  def symbol_is_constant?
    symbol =~ CONSTANT_PATTERN
  end

  def dest
    current_match[:dest]
  end

  def comp
    current_match[:comp]
  end

  def jump
    current_match[:jump]
  end
end
