require 'rails_helper'

RSpec.describe Event, type: :model do
  # Association test
  it { should have_one(:location) }
  it { should have_one(:schedule) }
end