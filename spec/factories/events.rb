FactoryBot.define do
  factory :event do
    name { Faker::StarWars.character }
    schedule
    location
  end
end