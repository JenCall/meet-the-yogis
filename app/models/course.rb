class Course < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy

  # validates :styles, :title, :address, :description, :price, :language, :availability, :date, :start_time, :end_time, presence: true
  # validates :title, length: { minimum: 3 }
  # validates :description, length: { minimum: 15 }
  has_one_attached :photo

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
