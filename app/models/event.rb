class Event < ApplicationRecord
  # Association
  has_one :location
  has_one :schedule
  has_many :ticket_types
end
