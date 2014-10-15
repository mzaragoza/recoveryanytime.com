Fabricator(:user) do
  username          { Faker::Internet.user_name }
  password          'password'
  email             { Faker::Internet.email }
  first_name        { Faker::Name.first_name }
  last_name         { Faker::Name.last_name }
  gender            { ['male', 'female'].sample }
  address           { Faker::AddressUS.street_address }
  city              { Faker::AddressUS.secondary_address }
  state             { Faker::AddressUS.state_abbr }
  zip               { Faker::AddressUS.zip_code }
  phone             { Faker::PhoneNumber.short_phone_number }
  sober_date        { DateTime.now - 30.days  }
  birthday          { DateTime.now - 30.years }
  active            { true }
end
