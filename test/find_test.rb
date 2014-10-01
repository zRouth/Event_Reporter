gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/find'

class FindTest < Minitest::Test

  def test_entries_has_been_called_on_nil_until_file_is_loaded
    find = Find.new
    assert_equal nil, find.entries
  end

  def test_

end
