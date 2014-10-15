Fabricator(:facility) do
  type_of           { ['treatment', 'detox', 'sober_living', 'intensive_outpatient', 'interventionists', 'outpatient_detox'].sample}
  name              { Faker::HealthcareIpsum.words(rand(4)+1).join(' ') }
  address           { Faker::AddressUS.street_address }
  city              { Faker::AddressUS.secondary_address }
  state             { Faker::AddressUS.state_abbr }
  zip               { Faker::AddressUS.zip_code }
  description       { Faker::HealthcareIpsum.words(rand(40)+1).join(' ') }
  contact_name      { Faker::Name.first_name + ' ' + Faker::Name.last_name  }
  contact_email     { Faker::Internet.email }
  contact_phone     { Faker::PhoneNumber.short_phone_number }
  link              { 'http://' + Faker::Internet.domain_name }
  active            {true}
  short_description { Faker::HealthcareIpsum.words(rand(10)+1).join(' ') }
end

