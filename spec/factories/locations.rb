FactoryBot.define do
  factory :location do
    address { Faker::Address.street_address }
    city { Faker::Address.city }
    state { Faker::Address.state }
    country { Faker::Address.country }
    postal_code { Faker::Address.postcode }
    phone_number { Faker::PhoneNumber.phone_number }
  end
end