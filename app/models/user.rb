class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # validates :first_name, :last_name, presence: true
  # validates :email, presence: true
  has_many :bookings, dependent: :destroy
  has_many :courses, dependent: :destroy

  enum status: { teacher: 0, student: 1 }

  def self.teachers
    User.where(status: 0)
  end

  def self.students
    User.where(status: 1)
  end

  include PgSearch::Model
  pg_search_scope :addressbased_teacher_search,
  against: [ :first_name ],
    associated_against: {
      course: [ :address ]
    },
    using: {
      tsearch: { prefix: true }
    }

end
