class PreferenceStudent < ApplicationRecord
  has_one :student
  belongs_to :preference

  validates :student, :preference, presence: true
end
