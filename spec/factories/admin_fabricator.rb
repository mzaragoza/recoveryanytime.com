Fabricator(:admin) do
  password          'password'
  email             { Faker::Internet.email }
  first_name        { Faker::Name.first_name }
  last_name         { Faker::Name.last_name }
  phone             { Faker::PhoneNumber.short_phone_number }
  active            { true }
end
