class Preference < ApplicationRecord
  belongs_to :student
  has_one :teacher
  has_one :preference_student

  validates :student, presence: true
end
