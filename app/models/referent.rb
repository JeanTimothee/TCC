class Referent < ApplicationRecord
  has_many :students
  has_many :payments, through: :students

  validates :last_name, uniqueness: { scope: :mobile_phone }
  validates :last_name, :first_name, presence: true
end
