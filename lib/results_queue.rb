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

  def sort_queue(attribute1)
    @results.sort! { |a,b| a.send(attribute1.to_sym) <=> b.send(attribute1.to_sym) }
    print_queue
  end

  def print_queue
    tp @results
  end

  def return_results
    @results
  end

end
