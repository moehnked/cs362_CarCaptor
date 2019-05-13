require 'rails_helper'

RSpec.describe Ownedcar, type: :model do
  let(:ownedcar) {FactoryBot.build(:ownedcar, :civic)}
  let(:ownedcar2) {FactoryBot.build(:ownedcar, :ae86)}

  it "expects a new car to have all its parameters" do
  		expect(ownedcar.year).to eq(2001)
  		expect(ownedcar.make).to eq("Honda")
  		expect(ownedcar.model).to eq("Civic")
  		expect(ownedcar.coolness_value).to eq(1)
  		expect(ownedcar.horsepower).to eq(190)
  		expect(ownedcar.torque).to eq(220)
  		expect(ownedcar.weight).to eq(3690)
  end

  it "can calculate power to weight ratio" do
  		pwr_expected = 190.fdiv(3690)
  		expect(ownedcar.calculate_power_to_weight_ratio).to eq(pwr_expected)
  end

  it "expects a car with higher ptwr to win" do
  		expect(ownedcar.does_opponent_win_simple_drag_race?(ownedcar2)).to be true
  		expect(ownedcar2.does_opponent_win_simple_drag_race?(ownedcar)).to be false
  end

  it "expects setup to alter default parameters of an already defaulted car" do
  		ownedcar.setup(year: 1999, 
  			make: "Ford", 
  			model: "Explorer", 
  			coolness_value: 1, 
  			horsepower: 160,
  			torque: 225,
  			weight: 3891 )
  		expect(ownedcar.year).to eq(1999)
  		expect(ownedcar.make).to eq("Ford")
  		expect(ownedcar.model).to eq("Explorer")
  		expect(ownedcar.coolness_value).to eq(1)
  		expect(ownedcar.horsepower).to eq(160)
  		expect(ownedcar.torque).to eq(225)
  		expect(ownedcar.weight).to eq(3891)
  	end

  	it "can print out the values we want the user to see" do
		ownedcar.setup(year: 1999, 
				make: "Ford", 
				model: "Explorer", 
				coolness_value: 1, 
				horsepower: 160,
				torque: 225,
				weight: 3891 )
      test_string = ownedcar.info
      expect(test_string).to eq("1999 Ford Explorer, hp 160, tq 225, weight 3891")
    end

end
