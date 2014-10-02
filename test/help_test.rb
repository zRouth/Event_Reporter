gem 'minitest', '~> 5.0'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/help'

class HelpTest < Minitest::Test
  def help_intro
    "Here is a list of all the commands at your disposal. Type help <command> to view what it does.
    -help
    -load <filename>
    -queue count
    -queue clear
    -queue print
    -queue print by <attribute>
    -queue save to <filename.csv>
    -find <attribute> <criteria>
    -find <attribute> <criteria> and <atribute> <criteria>"
  end

  def test_help_can_branch_to_help_into
    help_obj = Help.new
    assert_equal help_intro, help_obj.help_select("h")
    assert_equal help_intro, help_obj.help_select("help")
    refute_equal help_intro, help_obj.help_select("heelp")
    refute_equal help_intro, help_obj.help_select("helpp")
  end

  def load_description
    "Load <filename> allows you to load a file."
  end

  def test_help_can_branch_to_load_description
    help_obj = Help.new
    assert_equal load_description, help_obj.help_select("help load")
    refute_equal load_description, help_obj.help_select("help looadd")
    refute_equal load_description, help_obj.help_select("help laod")
  end

  def queue_count
    "Queue count -tells you how many records are in the current queue."
  end

  def test_help_can_branch_to_queue_count_description
    help_obj = Help.new
    assert_equal queue_count, help_obj.help_select("help queue count")
    refute_equal queue_count, help_obj.help_select("help queue")
    refute_equal queue_count, help_obj.help_select("help load")
  end

  def queue_clear
    "Queue clear -empties the current queue."
  end

  def test_help_can_branch_to_queue_clear_description
    help_obj = Help.new
    assert_equal queue_clear, help_obj.help_select("help queue clear")
    refute_equal queue_clear, help_obj.help_select("help queue count")
    refute_equal queue_clear, help_obj.help_select("help")
  end

  def queue_print_attribute
    "Queue print by <attribute> will print the data table sorted by a specific attribute such as zipcode"
  end

  def test_help_can_branch_to_queue_print_by_sorted_description
    help_obj = Help.new
    assert_equal queue_print_attribute, help_obj.help_select("help queue print by last_name")
    assert_equal queue_print_attribute, help_obj.help_select("help queue print by first_name")
    refute_equal queue_print_attribute, help_obj.help_select("help queue print")
    refute_equal queue_print_attribute, help_obj.help_select("help queue")
  end

  def queue_print
    "Queue print -prints out a data table of the current queue."
  end

  def test_help_can_branch_to_queue_print_description_without_being_sorted
    help_obj = Help.new
    assert_equal queue_print, help_obj.help_select("help queue print")
    refute_equal queue_print, help_obj.help_select("help queue print by first_name")
    refute_equal queue_print, help_obj.help_select("help queue")
  end

  def save_file
    "Queue save to <filename.csv> -will export the current queue to the specified filename as a CSV."
  end

  def test_help_can_branch_to_save_file_description
    help_obj = Help.new
    assert_equal save_file, help_obj.help_select("help queue save")
    refute_equal save_file, help_obj.help_select("help queue print")
    refute_equal save_file, help_obj.help_select("help queue")
  end

  def find_criteria
    "Find <attribute> <criteria> will load the queue with all records matching the criteria for the given attribute."
  end

  def test_help_can_branch_to_find_criteria_attribute_description
    help_obj = Help.new
    assert_equal find_criteria, help_obj.help_select("help find <attribute> <criteria>")
    refute_equal find_criteria, help_obj.help_select("help find <attribute> <criteria> and <attribute> <criteria>")
    refute_equal find_criteria, help_obj.help_select("help find")
  end

  def find_criteria_and
    "Find <attribute> <criteria> and <attribute> <criteria> will load the queue with all records matching the two criteria and attributes."
  end

  def test_help_can_branch_to_find_criteria_attribute_description
    help_obj = Help.new
    assert_equal find_criteria_and, help_obj.help_select("help find <attribute> <criteria> and <attribute> <criteria>")
    refute_equal find_criteria_and, help_obj.help_select("help find <attribute> <criteria>")
    refute_equal find_criteria_and, help_obj.help_select("help find")
  end

end
