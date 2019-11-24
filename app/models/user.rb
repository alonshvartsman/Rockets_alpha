class User < ApplicationRecord
  has_many :bookings
  has_many :spaceships
  has_many :reserved_seats, through: :spaceships, source: :bookings
  validates :first_name, presence: true
  validates :last_name, presence: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
