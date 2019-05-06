require "rails_helper"

RSpec.describe Car do

  it "a car should be initialized with a coolness value greater than or equal to zero" do
    creator = CreateCar.new(year: 1997, make: "Ford", model: "Thing", coolness_value: 9, horsepower: 2000, torque: 2000, weight: 5000)
    creator.build
    expect(creator.car.coolness_value).to be >= 0
  end
  
  it "calculates power-to-weight ratio properly" do
    creator = CreateCar.new(year: 1997, make: "Ford", model: "Thing", coolness_value: 9, horsepower: 2000, torque: 2000, weight: 5000)
    creator.build
    pwr_expected = 2000.fdiv(5000)
    expect(creator.car.power_weight_ratio).to eq(pwr_expected)
  end
  
  it "a car with a higher power-to-weight ratio should win a drag race" do
    car1 = CreateCar.new(year: 1997, make: "Ford", model: "High Ratio", coolness_value: 9, horsepower: 2000, torque: 2000, weight: 5000)
    car1.build
    car2 = CreateCar.new(year: 1997, make: "Ford", model: "Low Ratio", coolness_value: 9, horsepower: 200, torque: 200, weight: 5000)
    car2.build
    expect(car1.car.does_opponent_win_simple_drag_race?(car2.car)).to be false
  end
  
  it "a car with a lower power-to-weight ratio should lose a drag race" do
    car1 = CreateCar.new(year: 1997, make: "Ford", model: "Low Ratio", coolness_value: 9, horsepower: 200, torque: 200, weight: 5000)
    car1.build
    car2 = CreateCar.new(year: 1997, make: "Ford", model: "High Ratio", coolness_value: 9, horsepower: 2000, torque: 2000, weight: 5000)
    car2.build
    expect(car1.car.does_opponent_win_simple_drag_race?(car2.car)).to be true
  end

end
