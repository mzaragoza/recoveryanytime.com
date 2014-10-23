Fabricator(:meeting) do
  name                   { Faker::Company.name }
  location               { Faker::Company.name }
  address                { Faker::AddressUS.street_address }
  city                   { Faker::AddressUS.secondary_address }
  state                  { Faker::AddressUS.state_abbr }
  zip                    { Faker::AddressUS.zip_code }
  format                 { Faker::Company.name }
  language               { ['english','spanish','mandarin','hindi','arabic','portuguese','bengali'].sample }
  meeting_time           { DateTime.now + rand(336).hours }
  description            { Faker::HealthcareIpsum.words(rand(10)+1).join(' ') }
  hadicapped_accessable  { true }
  after_build do |m|
    m.fellowship ||= Fellowship.last || Fabricate(:fellowship)
  end
end

