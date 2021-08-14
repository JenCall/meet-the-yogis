class Course < ApplicationRecord
  belongs_to :user
  validates :styles, :title, :address, :description, :price, :language, :availability, :date, :start_time, :end_time, presence: true
  validates :title, length: { minimum: 3 }
  validates :description, length: { minimum: 15 }
end
