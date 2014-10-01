gem 'minitest', '~> 5.0'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/csv'
require_relative '../lib/entry'
require_relative '../lib/find'
require_relative '../lib/results_queue'

class CsvTest < Minitest::Test

  def test_it_can_load_a_file_and_create_entries
    csv_obj = Csv.new
    entries = csv_obj.load_file("../test/test_event_attendees.csv")
    
    assert_equal 5, entries.size
    assert_equal "Allison", entries.first.first_name
    assert_equal "Zimmerman", entries.last.last_name
    assert_equal "Douglas", entries.last.first_name
    assert_equal "Nguyen", entries.first.last_name
    assert_equal "Dc", entries.first.state
    assert_equal "Des moines", entries.last.city
  end
end
