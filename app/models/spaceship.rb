class Spaceship < ApplicationRecord
  has_many :bookings, dependent: :destroy
  belongs_to :user
  validates :name, presence: true
  validates :cost, presence: true
  validates :launch_site, presence: true
  mount_uploader :photo, PhotoUploader
end
