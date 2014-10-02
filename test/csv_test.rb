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
    assert_equal "6154385000", entries.first.home_phone
    assert_equal "4252745000", entries.last.home_phone
    assert_equal "Washington", entries.first.city
    assert_equal "20010", entries.first.zipcode
    assert_equal "50309", entries.last.zipcode
    assert_equal "Ia", entries.last.state
    assert_equal "Arannon@jumpstartlab.com", entries.first.email_address
    assert_equal "Vjeller.79@jumpstartlab.com", entries.last.email_address
    assert_equal "11/12/08", entries.first.date
    assert_equal "11/12/08", entries.last.date
    assert_equal "3155 19th st nw", entries.first.street
    assert_equal "1818 woodland ave #101", entries.last.street
  end
end
