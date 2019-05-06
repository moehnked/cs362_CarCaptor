require "rails_helper"

RSpec.describe CreateCar do
  it "creates a car given year, make, model, and coolness value" do
    creator = CreateCar.new(year: 1997, make: "Ford", model: "Thing", coolness_value: 9, horsepower: 280, weight: 5000)
    creator.build
    expect(creator.car.year).to eq(1997)
    expect(creator.car.make).to eq("Ford")
    expect(creator.car.model).to eq("Thing")
    expect(creator.car.coolness_value).to eq(9)
  end
  
  describe "failure cases" do
    it "fails when trying to save a car with no year" do
      creator = CreateCar.new(year: nil, make: "Ford", model: "Thing", coolness_value: 9, horsepower: 280, weight: 5000)
      creator.create
      expect(creator).not_to be_a_success
    end
  end
end