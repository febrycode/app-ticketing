class Transaction < ApplicationRecord
  belongs_to :event
  has_many :transaction_details

  validates :customer_name, presence: true
  validates :customer_email, presence: true
  validates :event_id, presence: true
end
