class Event < ApplicationRecord
  # Association
  belongs_to :location
  has_one :schedule
  has_many :ticket_types
end
