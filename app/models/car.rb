class Car < ApplicationRecord

  validates :year, presence: true, numericality: { only_integer: true }

end