require 'table_print'
require_relative 'entry'

class ResultsQueue
  attr_reader :results

  def initialize(inputs = [])
    inputs = [] if inputs.nil?
    @results = inputs
  end

  def count
    results.count
  end

  def clear
    @results = []
  end

  def sort_queue
    @results.sort! { |a,b| a.last_name <=> b.last_name }
    print_queue
  end

  def print_queue
    tp @results
  end

  def return_results
    @results
  end

end
