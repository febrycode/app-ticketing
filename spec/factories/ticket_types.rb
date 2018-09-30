FactoryBot.define do
  factory :ticket_type do
    event
    name { Faker::Lorem.word }
    quota { 100 }
    price { 125000 }
  end
end