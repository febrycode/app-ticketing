FactoryBot.define do
  factory :transaction do
    customer_name { Faker::Name.name }
    customer_email { Faker::Internet.email }
    event
    total_price { 125000 }
  end
end