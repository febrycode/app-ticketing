class Event < ApplicationRecord
  # Association
  has_one :location
  has_one :schedule
end
