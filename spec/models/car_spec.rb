require "rails_helper"

RSpec.describe Car do
  it "a car should be initialized with a coolness value greater than or equal to zero" do
    creator = CreateCar.new(year: 1997, make: "Ford", model: "Thing", coolness_value: 9)
    creator.build
    expect(creator.car.coolness_value).to be >= 0
  end
  
end