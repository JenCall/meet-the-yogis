class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :first_name, :last_name, presence: true
  validates :email, presence: true
  # validates :style, inclusion: { in: %w(ashtanga hatha vinyasa yin) }
  # has_many :bookings, dependent: :destroy
  # has_many :classes, dependent: :destroy
end
