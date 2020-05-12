require_relative "parser.rb"

file = File.open("./new.rb", "r")

a = Parser.new(file)
while a.has_more_commands?
  p a.advance
  p a.command_type
  if a.command_type == :c_command
    puts "#{a.dest}=#{a.comp};#{a.jump}"
  elsif a.command_type == :a_command || a.command_type == :l_command
    puts a.symbol
  end
end
