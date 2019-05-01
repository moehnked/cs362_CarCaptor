class Car < ApplicationRecord

  validates :year, presence: true, numericality: { only_integer: true }
  
  attr_accessor :power_weight_ratio
  
  def calculate_power_to_weight_ratio
    @power_weight_ratio = self.horsepower.fdiv(self.weight)
  end

end