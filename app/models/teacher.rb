class Teacher < ApplicationRecord
  has_many :lessons
  has_many :preferences
  has_many :student_lessons, through: :lessons

  validates :first_name, :last_name, :phone, presence: true
  validates :last_name, uniqueness: { scope: :phone }
end
