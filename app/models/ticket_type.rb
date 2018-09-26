class TicketType < ApplicationRecord
  # Association
  belongs_to :event
end
