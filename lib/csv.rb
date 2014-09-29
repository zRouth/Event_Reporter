require 'csv'
require_relative 'entry'
require_relative 'find'

class Csv
  attr_reader :contents
  attr_accessor :contents

  def load_file(file_name = "event_attendees.csv")
    @contents = CSV.open file_name, headers: true, header_converters: :symbol
    create_entries
  end

  def create_entries
    contents.map do |row|
      Entry.new(row)
    end
  end

end
