class Entry
  attr_reader :id, :date, :first_name, :last_name, :email_address, :home_phone, :street, :city, :state, :zip_code
  #   ,RegDate,first_Name,last_Name,Email_Address,HomePhone,Street,City,State,Zipcode

  def initialize(data)
    @id = data[0]
    @date = data[:regdate]
    @first_name = clean_first_name(data[:first_name])
    @last_name = data[:last_name]
    @email_address = data[:email_address]
    @home_phone = data[:homephone]
    @street = data[:street]
    @city = data[:city]
    @state = data[:state]
    @zip_code = clean_zipcode(data[:zipcode])
  end

  def clean_first_name(name)
    name.downcase.capitalize
  end

  def clean_zipcode(zipcode)
    zipcode.to_s.rjust(5,"0")[0..4]
  end

  def name
    "#{@first_name} #{@last_name}"
  end

end
