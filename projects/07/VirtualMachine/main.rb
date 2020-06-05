require_relative "vm_translator.rb"

VMTranslator.new.translate_file(ARGV[0])
