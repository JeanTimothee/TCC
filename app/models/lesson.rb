class Lesson < ApplicationRecord
  COURTS = (1..5).to_a
  CAPACITIES = (2..9).to_a

  belongs_to :teacher, optional: true
  has_many :student_lessons
  has_many :students, through: :student_lessons

  validates :court, inclusion: { in: COURTS }
  validates :capacity, inclusion: { in: CAPACITIES }, unless: :mini_tennis?, allow_nil: true
  validates :start_time, :end_time, :court, presence: true
  validates :start_time, uniqueness: { scope: :court }, unless: :mini_tennis?
  validates :teacher, uniqueness: { scope: :start_time }

  def mini_tennis?
    self.mini_tennis
  end
end
