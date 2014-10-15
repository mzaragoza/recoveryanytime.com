Fabricator(:fellowship) do
  name           { Faker::HealthcareIpsum.word }
  description    { Faker::HealthcareIpsum.words(rand(40)+10).join(' ') }
  abbr           { Faker::HealthcareIpsum.word[0..1] }
  active         {true}
end

