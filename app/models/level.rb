class Level < ApplicationRecord
  NAMES = (1..24).to_a

  has_many :students

  validates :name, presence: true
  validates :name, inclusion: { in: NAMES }
end
