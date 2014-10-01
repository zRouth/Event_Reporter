require 'table_print'
require_relative 'entry'
require_relative 'csv'

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

  def save_queue(file_name = "~/event_reporter_sat/Event_Reporter/file.csv")
    headers = [:i_d, :regdate, :first_name, :last_name, :homephone, :email_address, :street, :city, :state, :zipcode]
    CSV.open(file_name, "w") do |csv|
      csv << headers
      results.each do |x|
        csv << [ x.id, x.date, x.first_name, x.last_name, x.email_address,
          x.home_phone, x.street, x.city, x.state, x.zipcode ]
      end
    end
  end
end
