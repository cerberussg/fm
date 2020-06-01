class Federation < ApplicationRecord
  has_many :divisions
  has_many :shows

  validates :name, presence: true, uniqueness: true
end
