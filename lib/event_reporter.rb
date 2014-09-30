require_relative 'cli'
require 'stringio'

start_program = CLI.new($stdin, $stdout)
start_program.welcome_user
