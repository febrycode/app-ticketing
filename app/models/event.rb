class Event < ApplicationRecord
  # Association
  belongs_to :location
  belongs_to :schedule
  has_many :ticket_types

  validates :name, presence: true
end
