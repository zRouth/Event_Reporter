require_relative 'cli'

start_program = CLI.new($stdin, $stdout)
start_program.welcome_user
