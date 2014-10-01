gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require_relative 'lib/entry'

class EntryTest < Minitest::Test
  def data
    {
    regdate: "11/08/09",
    first_name: "JOHN",
    last_name: "SMiTh",
    email_address: "metaProgr4mer@gmail.com",
    homephone: "(407) 555-5555",
    street: "1234 JoNes st.",
    city: "DeNver",
    state: "CO",
    zipcode: "8020400"
    }
  end

  def test_it_assigns_data_properly_1
    entry = Entry.new(data)
    assert_equal "John", entry.first_name
    assert_equal "Smith", entry.last_name
    assert_equal "Metaprogr4mer@gmail.com", entry.email_address
    assert_equal "4075555555", entry.home_phone
    assert_equal "1234 jones st.", entry.street
    assert_equal "Denver", entry.city
    assert_equal "Co", entry.state
    assert_equal "80204", entry.zipcode
  end

  def data2
    {
    regdate: "1/8/09",
    first_name: "JoHn",
    last_name: "SMITH",
    email_address: "MUPHASAAA@hotmail.com",
    homephone: "(407)555---5555",
    street: "1234 JAMESON ROAD ST.",
    city: "DeNVER",
    state: "CO",
    zipcode: "8020400000"
    }
  end

  def test_it_assigns_data_properly_2
    entry = Entry.new(data2)
    assert_equal "1/8/09", entry.date
    assert_equal "John", entry.first_name
    assert_equal "Smith", entry.last_name
    assert_equal "Muphasaaa@hotmail.com", entry.email_address
    assert_equal "4075555555", entry.home_phone
    assert_equal "1234 jameson road st.", entry.street
    assert_equal "Denver", entry.city
    assert_equal "Co", entry.state
    assert_equal "80204", entry.zipcode
  end

end











  #
  # def test_it_assigns_email_properly
  #   entry = Entry.new(data)
  #   assert_equal "Metaprogr4mer@gmail.com", entry.email_address
  # end
  #
  # def test_it_assigns_phone_number_properly
  #   entry = Entry.new(data)
  #   assert_equal "4075555555", entry.home_phone
  # end
  #
  # def test_it_assigns_street_properly
  #   entry = Entry.new(data)
