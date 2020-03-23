class Level < ApplicationRecord
  NAMES = []

  has_many :students

  validates :name, presence: true
  validates :name, inclusion: { in: NAMES }
end
