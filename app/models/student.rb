class Student < ApplicationRecord
  LEVELS = (1..24).to_a

  belongs_to :referent
  has_many :availabilities
  has_many :preferences
  has_many :preference_students
  has_many :student_lessons
  has_many :lessons, through: :student_lessons
  has_many :payments

  validates :first_name, :last_name, :birth_date, :mobile_phone, presence: true
  validates :last_name, inclusion: { scope: :first_name, :birth_date }
  validates :nb_classes, inclusion: { in: [1, 2] }
  validates :level, inclusion: { in: LEVELS }
end
