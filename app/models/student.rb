class Student < ApplicationRecord
  LEVELS = (1..26).to_a
  # LEVELS = ["C-", "C", "CC+", "C+", "C+b-", "C+B-", "B-", "B-B", "B", "BB+", "B+", "A-", "A", "A 30/5", "A 30/4", "A 30/3", "A 30/2", "A 30/1", "A 30", "A 15/5", "A 15/4", "A 15/4", "A 15/3", "A 15/2", "A 15/1", "A 15"]
  belongs_to :referent, optional: true
  has_many :availabilities
  has_many :preferences
  has_many :preference_students
  has_many :student_lessons
  has_many :lessons, through: :student_lessons
  has_many :payments

  validates :first_name, :last_name, :birth_date, :mobile_phone, presence: true
  validates :last_name, uniqueness: { scope: :birth_date }
  validates :nb_classes, inclusion: { in: [1, 2] }
  validates :level, inclusion: { in: LEVELS }, allow_nil: true
end
