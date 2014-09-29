require 'csv'
require_relative 'entry'
require_relative 'find'
require_relative 'results_queue'

class Csv
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

  def save_queue(results)
    headers = [:i_d, :regdate, :first_name, :last_name, :homephone, :email_address, :street, :city, :state, :zipcode]
    CSV.open((File.expand_path"~/desktop/file.csv"), "w") do |csv|
      csv << headers
      results.each do |x|
        csv << [ x.id, x.date, x.first_name, x.last_name, x.email_address,
          x.home_phone, x.street, x.city, x.state, x.zipcode ]
      end
    end
  end
end
