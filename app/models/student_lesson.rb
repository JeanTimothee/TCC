class StudentLesson < ApplicationRecord
  belongs_to :student
  belongs_to :lesson

  validates :student, :lesson, presence: true
  validates :student, uniqueness: { scope: :lesson }
end
