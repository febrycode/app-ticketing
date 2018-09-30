require 'rails_helper'

RSpec.describe Transaction, type: :model do
  # Association test
  it { should belong_to(:event) }
  it { should have_many(:transaction_details) }

  # Validation test
  it { should validate_presence_of(:customer_name) }
  it { should validate_presence_of(:customer_email) }
  it { should validate_presence_of(:event_id) }
end
