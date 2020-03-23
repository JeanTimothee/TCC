class Teacher < ApplicationRecord
  has_many :lessons
  has_many :preferences
  has_many :student_lessons, through: :lessons
end
