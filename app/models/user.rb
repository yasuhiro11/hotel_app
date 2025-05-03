class User < ApplicationRecord
  has_many :properties, dependent: :destroy
  has_many :reservations, dependent: :destroy
  has_many :bookings, dependent: :destroy

  has_one_attached :profile_image

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
