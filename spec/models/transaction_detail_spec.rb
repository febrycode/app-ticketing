require 'rails_helper'

RSpec.describe TransactionDetail, type: :model do
  # Association test
  it { should belong_to(:transaction_parent) }
  it { should belong_to(:ticket_type) }

  # Validation test
  it { should validate_presence_of(:transaction_id) }
  it { should validate_presence_of(:ticket_type_id) }
end
