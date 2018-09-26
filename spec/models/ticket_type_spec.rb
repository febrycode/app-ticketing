require 'rails_helper'

RSpec.describe TicketType, type: :model do
  # Association test
  it { should belong_to(:event) }
end
