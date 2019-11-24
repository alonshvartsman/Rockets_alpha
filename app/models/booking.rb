class Booking < ApplicationRecord
  belongs_to :spaceship
  belongs_to :user
  validates :date, presence: true
end
