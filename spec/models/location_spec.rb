require 'rails_helper'

RSpec.describe Location, type: :model do
  # Association test
  it { should have_many(:event) }
end