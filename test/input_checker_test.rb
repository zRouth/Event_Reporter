gem 'minitest', '~> 5.0'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/input_checker'

class InputCheckerTest < Minitest::Test

  def test_it_can_accept_input_on_initialize
    input_check = InputChecker.new("hello")
    assert_equal "hello", input_check.input
  end

  def test_it_can_be_passed_in_input
    input_check = InputChecker.new(" ")
    input_check.pass_input("goodbye")
    assert_equal "goodbye", input_check.input
  end

  def test_it_can_check_queue_count_input
    input_check = InputChecker.new("queue count")
    assert input_check.queue_count?
    input_check = InputChecker.new("qudjeue coudxynt")
    refute input_check.queue_count?
  end

  def test_it_can_check_help_input
    input_check = InputChecker.new("h")
    assert input_check.help?
    input_check = InputChecker.new("help")
    assert input_check.help?
    input_check = InputChecker.new("helpppp")
    refute input_check.help?
    input_check = InputChecker.new("hhhhh")
    refute input_check.help?
  end

  # def test_it_can_check_queue_count_input
  #   input_check = InputChecker.new("queue count")
  #   assert input_check.queue_count?
  #   input_check = InputChecker.new("qudjeue coudxynt")
  #   refute input_check.queue_count?
  # end

end
