class User < ApplicationRecord
  has_many :bookings
  has_many :spaceships
  has_many :reserved_seats, through: :spaceships, source: :bookings
  validates :first_name, presence: true
  validates :last_name, presence: true
end
