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

  def test_it_can_check_quit_input
    input_check = InputChecker.new("q")
    assert input_check.quit?

    input_check = InputChecker.new("quit")
    assert input_check.quit?

    input_check = InputChecker.new("qqqqq")
    refute input_check.quit?

    input_check = InputChecker.new("qquuiitt")
    refute input_check.quit?
  end

  def test_it_can_check_load_input
    input_check = InputChecker.new("load")
    assert input_check.load?

    input_check = InputChecker.new("looaadd")
    refute input_check.load?
  end

  def test_it_can_check_find_input
    input_check = InputChecker.new("find")
    assert input_check.find?

    input_check = InputChecker.new("find first_name Joe")
    assert input_check.find?

    input_check = InputChecker.new("find first_name sarah and state CA")
    refute input_check.find?

    input_check = InputChecker.new("find last_name Jones and state DC")
    refute input_check.find?
  end

  def test_it_can_check_find_and_input
    input_check = InputChecker.new("find first_name sarah and state CA")
    assert input_check.find_and?

    input_check = InputChecker.new("find last_name Jones and state DC")
    assert input_check.find_and?

    input_check = InputChecker.new("find")
    refute input_check.find_and?

    input_check = InputChecker.new("find first_name Joe")
    refute input_check.find_and?
  end

  def test_it_can_check_queue_clear_input
    input_check = InputChecker.new("queue clear")
    assert input_check.queue_clear?

    input_check = InputChecker.new("queueue cleearr")
    refute input_check.queue_clear?
  end

  def test_it_can_check_queue_print_input
    input_check = InputChecker.new("queue print")
    assert input_check.queue_print?

    input_check = InputChecker.new("queueue priinntt")
    refute input_check.queue_print?
  end

  def test_it_can_check_queue_sort_input
    input_check = InputChecker.new("queue print by last_name")
    assert input_check.queue_sort?

    input_check = InputChecker.new("queue print")
    refute input_check.queue_sort?
  end

  def test_it_can_check_queue_save_input
    input_check = InputChecker.new("queue save")
    assert input_check.queue_save?

    input_check = InputChecker.new("queue print")
    refute input_check.queue_save?
  end

end
