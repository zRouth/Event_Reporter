require 'csv'
require_relative 'entry'

class Csv
  attr_reader :contents, :entries
  attr_accessor :contents

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

  def choose_attribute(attribute, criteria)
    case 
  end

  def find_by_unique_id(unique_id)
    entries.select { |entry| entry.id == unique_id }
  end

  def find_by_registration_date(registration_date)
    entries.select { |entry| entry.regdate == registration_date }
  end

  def find_by_first_name(first_name)
    entries.select { |entry| entry.first_name == first_name }
  end

  def find_by_last_name(last_name)
    entries.select { |entry| entry.last_name == last_name}
  end

  def find_by_email_address(email_address)
    entries.select { |entry| entry.email_address == email_address }
  end

  def find_by_homephone(homephone_number)
    entries.select { |entry| entry.homephone == homephone_number }
  end

  def find_by_street(street_name)
    entries.select { |entry| entry.street == street_name }
  end

  def find_by_city(city_name)
    entries.select { |entry| entry.city == city_name }
  end

  def find_by_state(state_name)
    entries.select { |entry| entry.state == state_name }
  end

  def find_by_zipcode(zipcode_num)
    entries.select { |entry| entry.zipcode == zipcode_num }
  end

  def queue_count
    entries.count
  end

end
