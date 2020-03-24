class Payment < ApplicationRecord
  TYPES = ["chèque", "espèce", "virement"]

  belongs_to :student

  validates :amount, :time, :student, presence: true
  validates :type, inclusion: { in: TYPES }
end
