class Entry
  attr_reader :id, :date, :first_name, :last_name, :email_address, :home_phone, :street, :city, :state, :zipcode
  #   ,RegDate,first_Name,last_Name,Email_Address,HomePhone,Street,City,State,Zipcode

  def initialize(data)
    @id = data[0]
    @date = clean_date(data[:regdate])
    @first_name = clean_generic(data[:first_name])
    @last_name = data[:last_name]
    @email_address = data[:email_address]
    @home_phone = data[:homephone]
    @street = data[:street]
    @city = data[:city]
    @state = clean_generic(data[:state])
    @zipcode = clean_zipcode(data[:zipcode])
  end

  def clean_generic(name)
    name.to_s.downcase.capitalize
  end

  def clean_zipcode(zipcode)
    zipcode.to_s.rjust(5,"0")[0..4]
  end

  def clean_date(date)
    date1, time1 = date.split
    date1
  end

  def name
    "#{@first_name} #{@last_name}"
  end

end
