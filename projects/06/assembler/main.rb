require_relative "assembler"

input_path = ARGV[0].to_s

if File.exist?(input_path)
  Assembler.new.assemble(input_path)
else
  puts "File #{input_path} doesn't exist"
end
