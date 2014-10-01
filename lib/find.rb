require_relative 'entry'

class Find
  attr_reader :entries

  def initialize(entries = nil)
    @entries = entries
  end

  def find_by(attribute, criteria)
    return if entries.nil?
    entries.select { |entry| entry.send(attribute.to_sym) == criteria.downcase.capitalize }
  end

end


  # def choose_attribute(attribute, criteria)
  #   case
  #   when attribute == "date"
  #     find_by_date(criteria)
  #   when attribute == "first_name"
  #     find_by_first_name(criteria)
  #   when attribute == "last_name"
  #     find_by_last_name(criteria)
  #   when attribute == "registration_date"
  #     find_by_registration_date(criteria)
  #   when attribute == "email_address"
  #     find_by_email_address(criteria)
  #   when attribute == "homephone"
  #     find_by_homephone(criteria)
  #   when attribute == "street"
  #     find_by_street(criteria)
  #   when attribute == "city"
  #     find_by_city(criteria)
  #   when attribute == "state"
  #     find_by_state(criteria)
  #   when attribute == "zipcode"
  #     find_by_zipcode(criteria)
  #   end
  # end
  #
  # def find_by_registration_date(registration_date)
  #   @results = entries.select { |entry| entry.regdate == registration_date }
  # end
  #
  # def find_by_first_name(first_name)
  #   @results = entries.select { |entry| entry.first_name == first_name }
  # end
  #
  # def find_by_last_name(last_name)
  #   @results = entries.select { |entry| entry.last_name == last_name}
  # end
  #
  # def find_by_email_address(email_address)
  #   @results = entries.select { |entry| entry.email_address == email_address }
  # end
  #
  # def find_by_homephone(homephone_number)
  #   @results = entries.select { |entry| entry.homephone == homephone_number }
  # end
  #
  # def find_by_street(street_name)
  #   @results = entries.select { |entry| entry.street == street_name }
  # end
  #
  # def find_by_city(city_name)
  #   @results = entries.select { |entry| entry.city == city_name }
  # end
  #
  # def find_by_state(state_name)
  #   @results = entries.select { |entry| entry.state == state_name }
  # end
  #
  # def find_by_zipcode(zipcode_num)
  #   @results = entries.select { |entry| entry.zipcode == zipcode_num }
  # end
  #
  # def find_by_date(date_num)
  #   @results = entries.select { |entry| entry.date == date_num }
  # enddef find_by(attribute, criteria)
  #   # attribute => first_name
  #   @results = entries.select { |entry| entry.send(attribute.to_sym) == criteria }
  # end
