class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # validates :first_name, :last_name, presence: true
  # validates :email, presence: true
  has_many :bookings, dependent: :destroy
  has_many :courses, dependent: :destroy
  has_one_attached :profile_avatar
  has_one_attached :card_image

  enum status: { teacher: 0, student: 1 }

  def self.teachers
    User.where(status: 0)
  end

  def self.students
    User.where(status: 1)
  end

end
