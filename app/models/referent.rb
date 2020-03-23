class Referent < ApplicationRecord
  has_many :students
  has_many :total_payments, through: :students
end
