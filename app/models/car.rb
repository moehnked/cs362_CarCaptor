class Car < ApplicationRecord
  validates :year, presence: true, numericality: { only_integer: true }

  def setup(params)
      self.year = params.fetch(:year, 1)
      self.make = params.fetch(:make, "automobile")
      self.model = params.fetch(:model, "car")
      self.coolness_value = params.fetch(:coolness_value, 1)
      self.horsepower = params.fetch(:horsepower, 1)
      self.torque = params.fetch(:torque, 1)
      self.weight = params.fetch(:weight, 1)
    end

    def calculate_power_to_weight_ratio
      self.horsepower.fdiv(self.weight)
    end

    def does_opponent_win_simple_drag_race?(opponent_car)
    if opponent_car.calculate_power_to_weight_ratio > self.calculate_power_to_weight_ratio
      true
    else
      false
    end
  end
end
