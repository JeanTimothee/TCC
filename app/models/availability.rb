class Availability < ApplicationRecord
  belongs_to :student

  validates :student, :start_time, :end_time, presence: true
end
