FactoryBot.define do
  factory :event do
    name { Faker::StarWars.character }
  end
end