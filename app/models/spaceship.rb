class Spaceship < ApplicationRecord
  geocoded_by :launch_site
  after_validation :geocode, if: :will_save_change_to_launch_site?
  after_save :default_picture
  has_many :bookings, dependent: :destroy
  belongs_to :user
  validates :name, presence: true
  validates :cost, presence: true
  validates :launch_site, presence: true
  mount_uploader :photo, PhotoUploader

  def default_picture
    if self.photo.url
      return true
    else
      self.remote_photo_url = "https://images.unsplash.com/photo-1545255754-34c0de401094?ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60"
      self.save
    end
  end
end
