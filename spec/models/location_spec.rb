require 'rails_helper'

RSpec.describe Location, type: :model do
  # Association test
  it { should belong_to(:event) }
end