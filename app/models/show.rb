class Show < ApplicationRecord
  belongs_to :federation

  validates :name, presence: true, uniqueness: true
  validates :day_of_week, presence: true
  validates :number_of_matches, presence: true
end
