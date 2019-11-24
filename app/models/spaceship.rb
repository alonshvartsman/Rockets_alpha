class Spaceship < ApplicationRecord
  has_many :bookings
  belongs_to :user
  validates :name, presence: true
  validates :cost, presence: true
  validates :launch_site, presence: true
end
