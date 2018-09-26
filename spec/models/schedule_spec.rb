require 'rails_helper'

RSpec.describe Schedule, type: :model do
  # Association test
  it { should belong_to(:event) }
end
