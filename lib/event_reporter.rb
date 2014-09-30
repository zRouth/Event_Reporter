require_relative 'cli'
require 'stringio'

start_program = CLI.new($stdin, $stdout)
start_program.repl_loop

