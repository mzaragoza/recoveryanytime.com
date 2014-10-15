Fabricator(:promotion) do
  name              { Faker::HealthcareIpsum.words(rand(4)+1).join(' ') }
  link              { 'http://' + Faker::Internet.domain_name }
  active            { true }
end

