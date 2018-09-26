require 'rails_helper'

RSpec.describe Schedule, type: :model do
  # Association
  it { should belong_to(:event) }
end
