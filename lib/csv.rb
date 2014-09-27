require 'csv'

class Csv

  def initialize

  end

  def load_file
    contents = CSV.open "event_attendees.csv", headers: true, header_converters: :symbol

    lines = File.readlines "event_attendees.csv"
    lines.each do |line|
      puts line
    end

    # contents.each do |row|
    #   id = row[0]
    #   name = row[:name]
    # end
    #
    # puts contents
  end

end
