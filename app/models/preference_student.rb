class PreferenceStudent < ApplicationRecord
  has_one :student
  belongs_to :preference
end
