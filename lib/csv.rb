require 'csv'
require_relative 'entry'

class Csv
  attr_reader :contents, :entries
  attr_accessor :contents

  def load_file(file_name = "event_attendees.csv")
    @contents = CSV.open file_name, headers: true, header_converters: :symbol
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
    when attribute == "first_name"
      find_by_first_name(criteria)
    when attribute == "last_name"
      find_by_last_name(criteria)
    when attribute == "registration_date"
      find_by_registration_date(criteria)
    when attribute == "email_address"
      find_by_email_address(criteria)
    when attribute == "homephone"
      find_by_homephone(criteria)
    when attribute == "street"
      find_by_street(criteria)
    when attribute == "city"
      find_by_city(criteria)
    when attribute == "state"
      find_by_state(criteria)
    when attribute == "zipcode"
      find_by_zipcode(criteria)
    end
  end

  def find_by_registration_date(registration_date)
    @entries = entries.select { |entry| entry.regdate == registration_date }
  end

  def find_by_first_name(first_name)
    @entries = entries.select { |entry| entry.first_name == first_name }
  end

  def find_by_last_name(last_name)
    @entries = entries.select { |entry| entry.last_name == last_name}
  end

  def find_by_email_address(email_address)
    @entries = entries.select { |entry| entry.email_address == email_address }
  end

  def find_by_homephone(homephone_number)
    @entries = entries.select { |entry| entry.homephone == homephone_number }
  end

  def find_by_street(street_name)
    @entries = entries.select { |entry| entry.street == street_name }
  end

  def find_by_city(city_name)
    @entries = entries.select { |entry| entry.city == city_name }
  end

  def find_by_state(state_name)
    @entries = entries.select { |entry| entry.state == state_name }
  end

  def find_by_zipcode(zipcode_num)
    @entries = entries.select { |entry| entry.zipcode == zipcode_num }
  end

  def queue_count
    entries.count
  end

  def queue_clear
    load_file
  end

end
