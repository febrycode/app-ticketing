class TransactionDetail < ApplicationRecord
  belongs_to :ticket_type
  belongs_to :transaction_parent, foreign_key: 'transaction_id', class_name: 'Transaction'

  validates :ticket_type_id, presence: true
  validates :transaction_id, presence: true
end
