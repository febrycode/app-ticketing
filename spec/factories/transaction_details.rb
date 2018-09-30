FactoryBot.define do
  factory :transaction_detail do
    # association :transaction_parent, factory: :transaction
    ticket_type
    qty { 1 }
    price_n_qty { 125000 }
  end
end