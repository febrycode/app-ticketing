require 'rails_helper'

RSpec.describe Event, type: :model do
  # Association test
  it { should belong_to(:location) }
  it { should belong_to(:schedule) }
  it { should have_many(:ticket_types) }

  # Validation test
  it { should validate_presence_of(:name) }
end