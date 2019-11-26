class Spaceship < ApplicationRecord
  geocoded_by :launch_site
  after_validation :geocode, if: :will_save_change_to_launch_site?
  has_many :bookings
  has_many :bookings, dependent: :destroy
  
  belongs_to :user
  validates :name, presence: true
  validates :cost, presence: true
  validates :launch_site, presence: true
  mount_uploader :photo, PhotoUploader
end
