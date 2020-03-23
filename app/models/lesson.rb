class Lesson < ApplicationRecord
  COURTS = [1, 2, 3, 4, 5]
  CAPACITIES = [2, 3, 4, 5, 6, 7, 8, 9]

  belongs_to :teacher
  has_many :student_lessons
  has_many :students, through: :student_lessons

  validates :court, inclusion: { in: COURTS }
  validates :capacity, inclusion: { in: CAPACITIES }
  validates :start_time, :end_time, :court, :teacher, presence: true
  validates :start_time, uniqueness: { scope: :court }
  validates :teacher, uniqueness: { scope: :start_time }
end
