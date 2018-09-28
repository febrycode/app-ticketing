class Location < ApplicationRecord
  # Association
  has_many :event

  validates :address, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :country, presence: true
  validates :postal_code, presence: true
  validates :phone_number, presence: true
end
