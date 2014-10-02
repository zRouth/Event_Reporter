gem 'minitest', '~> 5.0'
require 'minitest/autorun'
require 'minitest/pride'
require 'stringio'
require_relative '../lib/cli'
require_relative '../lib/message_log'
require_relative '../lib/help'
require_relative '../lib/csv'
require_relative '../lib/find'
require_relative '../lib/results_queue'
require_relative '../lib/input_checker'

class HelpTest < Minitest::Test
  def setup
    @input = StringIO.new("quit")
    @output = StringIO.new
  end

  def test_can_start_CLI
    cli_obj = CLI.new(@input,@output)
  end

  def test_welcome_test_user
    cli_obj = CLI.new(@input,@output)
    cli_obj.welcome_user
    assert_match /Welcome/, @output.string
  end

  def test_repl_loop_help_input
    @input = StringIO.new("help\nquit")
    cli_obj = CLI.new(@input,@output)
    cli_obj.welcome_user
    assert_match /Here is a list/, @output.string
  end

  # def test_repl_loop_quit_input
  #   @input = StringIO.new("quit")
  #   cli_obj = CLI.new(@input,@output)
  #   cli_obj.welcome_user
  #   assert_match /Here is a list/, @output.string
  # end




end
