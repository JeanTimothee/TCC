class Lesson < ApplicationRecord
  COURTS = (1..5).to_a
  CAPACITIES = (2..9).to_a

  belongs_to :teacher
  has_many :student_lessons
  has_many :students, through: :student_lessons

  validates :court, inclusion: { in: COURTS }
  validates :capacity, inclusion: { in: CAPACITIES }
  validates :start_time, :end_time, :court, :teacher, presence: true
  validates :start_time, uniqueness: { scope: :court }
  validates :teacher, uniqueness: { scope: :start_time }
end
