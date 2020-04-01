class Student < ApplicationRecord
  LEVELS = (1..26).to_a
  # LEVELS = ["C-", "C", "CC+", "C+", "C+b-", "C+B-", "B-", "B-B", "B", "BB+", "B+", "A-", "A", "A 30/5", "A 30/4", "A 30/3", "A 30/2", "A 30/1", "A 30", "A 15/5", "A 15/4", "A 15/4", "A 15/3", "A 15/2", "A 15/1", "A 15"]
  belongs_to :referent, optional: true
  has_many :availabilities, dependent: :destroy
  has_many :preferences, dependent: :destroy
  has_many :preference_students, dependent: :destroy
  has_many :student_lessons, dependent: :destroy
  has_many :lessons, through: :student_lessons
  has_many :payments, dependent: :destroy

  validates :first_name, :last_name, :birth_date, :mobile_phone, presence: true
  validates :last_name, uniqueness: { scope: :birth_date }
  validates :nb_classes, inclusion: { in: [1, 2] }
  validates :level, inclusion: { in: LEVELS }, allow_nil: true

  def age?
    ((Time.zone.now - self.birth_date.to_time) / 1.year.seconds).floor
  end

  def level?
    case self.level
    when level = 14
      "C-"
    when level = 1
      "C"
    when level = 2
      "CC+"
    when level = 3
      "C+"
    when level = 4
      "C+b-"
    when level = 5
      "C+B-"
    when level = 6
      "B-"
    when level = 7
      "B-B"
    when level = 8
      "B"
    when level = 9
      "BB+"
    when level = 10
      "B+"
    when level = 11
      "A-"
    when level = 12
      "A"
    when level = 13
      "A 30/5"
    when level = 15
      "A 30/4"
    when level = 16
      "A 30/3"
    when level = 17
      "A 30/2"
    when level = 18
      "A 30/1"
    when level = 20
      "A 30"
    when level = 19
      "A 15/5"
    when level = 21
      "A 15/4"
    when level = 22
      "A 15/4"
    when level = 23
      "A 15/3"
    when level = 24
      "A 15/2"
    when level = 25
      "A 15/1"
    when level = 26
      "A 15"
    end
  end
end
