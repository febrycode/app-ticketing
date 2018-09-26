require 'rails_helper'

RSpec.describe Event, type: :model do
  # Association test
  it { should have_one(:location) }
  it { should have_one(:schedule) }
  it { should have_many(:ticket_types) }
end