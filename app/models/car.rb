class Car < ApplicationRecord

  validates :year, presence: true, numericality: { only_integer: true }
  
  attr_accessor :power_weight_ratio
  
  def calculate_power_to_weight_ratio
    @power_weight_ratio = self.horsepower.fdiv(self.weight)
  end
  
  def does_opponent_win_simple_drag_race?(opponent_car)
    if opponent_car.power_weight_ratio > self.power_weight_ratio
      true
    else
      false
    end
  end

end