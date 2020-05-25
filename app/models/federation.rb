class Federation < ApplicationRecord
  has_many :divisions

  validates :name, presence: true, uniqueness: true
end
