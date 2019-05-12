require 'rails_helper'

RSpec.describe Car, type: :model do
  	car = Car.new
  	car.setup()

  	it "expects a new car to have all its parameters" do
  		expect(car.year).to eq(1)
  		expect(car.make).to eq("automobile")
  		expect(car.model).to eq("car")
  		expect(car.coolness_value).to eq(1)
  		expect(car.horsepower).to eq(1)
  		expect(car.torque).to eq(1)
  		expect(car.weight).to eq(1)
  	end

  	it "calculates power-to-weight ratio properly" do
	    car2 = Car.new(year: 1997, make: "Ford", model: "Thing", coolness_value: 9, horsepower: 2000, torque: 2000, weight: 5000)
	    pwr_expected = 2000.fdiv(5000)
	    expect(car2.calculate_power_to_weight_ratio).to eq(pwr_expected)
  	end

  	it "a car with a higher power-to-weight ratio should win a drag race" do
	    car1 = Car.new(year: 1997, make: "Ford", model: "High Ratio", coolness_value: 9, horsepower: 2000, torque: 2000, weight: 5000)
	    car2 = Car.new(year: 1997, make: "Ford", model: "Low Ratio", coolness_value: 9, horsepower: 200, torque: 200, weight: 5000)
	    expect(car1.does_opponent_win_simple_drag_race?(car2)).to be false
  	end

  	it "expects setup to alter default parameters of an already defaulted car" do
  		car.setup(year: 1999, 
  			make: "Ford", 
  			model: "Explorer", 
  			coolness_value: 1, 
  			horsepower: 160,
  			torque: 225,
  			weight: 3891 )
  		expect(car.year).to eq(1999)
  		expect(car.make).to eq("Ford")
  		expect(car.model).to eq("Explorer")
  		expect(car.coolness_value).to eq(1)
  		expect(car.horsepower).to eq(160)
  		expect(car.torque).to eq(225)
  		expect(car.weight).to eq(3891)
  	end

    it "can calculate power to weight ratios for itself" do
      car.setup(year: 1999, 
        make: "Ford", 
        model: "Explorer", 
        coolness_value: 1, 
        horsepower: 160,
        torque: 225,
        weight: 3891 )
      expect(car.calculate_power_to_weight_ratio).to be_within(0.001).of(0.0411)
    end

    it "can print out the values we want the user to see" do
      test_string = car.info
      expect(test_string).to eq("1999 Ford Explorer, hp 160, tq 225, weight 3891")
    end
end
