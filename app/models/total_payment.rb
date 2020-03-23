class TotalPayment < ApplicationRecord
  has_many :students
  has_many :payments
  has_one :referent, through: :students
end
