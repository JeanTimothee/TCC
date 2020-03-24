class Payment < ApplicationRecord
  TYPES = ["chèque", "virement", "espèce"]
  belongs_to :total_payment

  validates :amount, :time, :total_payment, presence: true
  validates :type, inclusion: { in: TYPES }
end
