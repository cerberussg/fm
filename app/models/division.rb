class Division < ApplicationRecord
  belongs_to :federation

  validates :name, presence: true, uniqueness: true
end
