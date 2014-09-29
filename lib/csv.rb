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

  # def save_queue(results)
  #   CSV.open((File.expand_path"~/desktop/file.csv"), "w") do |csv|
  #       csv << "abc"
  #     end
  #   end
  # end

  def save_queue(results)
    headers = [:_, :regdate, :first_name, :last_name, :homephone, :email_address, :street, :city, :state, :zipcode]
    CSV.open((File.expand_path"~/desktop/file.csv"), "w") do |csv|
      csv << headers
      results.each do |d|
        csv << [
          d.id, d.date, d.first_name, d.last_name, d.email_address,
          d.home_phone, d.street, d.city, d.state, d.zipcode
        ]
      end
    end
  end

end
