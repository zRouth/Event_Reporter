gem 'minitest', '~> 5.0'
require 'minitest/autorun'
require 'minitest/pride'
require 'table_print'
require_relative '../lib/results_queue'
require_relative '../lib/entry'
require_relative '../lib/csv'

class ResultsQueueTest < Minitest::Test
  def test_it_knows_its_count
    assert_equal 0, ResultsQueue.new([]).count

    queue = ResultsQueue.new([Entry.new({}), Entry.new({})])
    assert_equal 2, queue.count
  end

  def test_it_can_clear_its_results
    queue = ResultsQueue.new([Entry.new({}), Entry.new({})])
    assert_equal 2, queue.count
    queue.clear
    assert_equal 0, queue.count

    queue = ResultsQueue.new([Entry.new({}), Entry.new({}), Entry.new({}), Entry.new({})])
    assert_equal 4, queue.count
    queue.clear
    assert_equal 0, queue.count
  end

  def test_it_can_sort_by_some_attribute
    queue = ResultsQueue.new([
      Entry.new(0 => 2, first_name: 'a', last_name: 'c'),
      Entry.new(0 => 1, first_name: 'b', last_name: 'b'),
      Entry.new(0 => 3, first_name: 'c', last_name: 'a'),
    ])
    queue.sort_queue :id
    assert_equal [1, 2, 3], queue.results.map { |e| e.id }

    queue.sort_queue :first_name
    assert_equal [2, 1, 3], queue.results.map { |e| e.id }

    queue.sort_queue :last_name
    assert_equal [3, 1, 2], queue.results.map { |e| e.id }
  end

  def test_it_can_save_results
    queue = ResultsQueue.new([
      Entry.new(0 => 2, first_name: 'a', last_name: 'c'),
      Entry.new(0 => 1, first_name: 'b', last_name: 'b'),
      Entry.new(0 => 3, first_name: 'c', last_name: 'a'),
    ])

    queue.save_queue("results_queue_save_test_example.csv")

    File.file?("/test/results_queue_save_test_example.csv")
    File.exist?("/test/results_queue_save_test_example.csv")
  end
end
