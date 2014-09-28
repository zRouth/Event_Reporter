require 'csv'
require_relative 'entry'

class Csv
  attr_reader :contents, :entries

  def load_file
    @contents = CSV.open "event_attendees.csv", headers: true, header_converters: :symbol
    create_entries
  end

  def create_entries
    rows = contents.map do |row|
        Entry.new(row)
      end
    @entries = rows
  end

  def find_by_first_name(name)
    @entries = entries.select { |entry| entry.first_name == name }
  end

  def find_by_last_name(name)
    @entries = entries.select { |entry| entry.last_name == name}
  end

  def find_by_first_and_last_name(first, last)
    entries.select { |entry| entry.first_name == first}.select { |entry| entry.last_name == last }
  end

  def find_by_number(number)
    entries.select {|entry| entry.phone_number == number}
  end

  def queue_count
    entries.count
  end

end
