require 'rails_helper'

RSpec.describe Location, type: :model do
  # Association test
  it { should have_many(:event) }

  # Validation test
  it { should validate_presence_of(:address) }
  it { should validate_presence_of(:city) }
  it { should validate_presence_of(:state) }
  it { should validate_presence_of(:country) }
  it { should validate_presence_of(:postal_code) }
  it { should validate_presence_of(:phone_number) }
end