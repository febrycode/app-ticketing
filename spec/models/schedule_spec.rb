require 'rails_helper'

RSpec.describe Schedule, type: :model do
  # Association test
  it { should have_many(:event) }
end
