require "rails_helper"

RSpec.describe Car do
  it "a car should be initialized with a coolness value greater than or equal to zero" do
    car = Car.new
    expect(car.coolness_value).to be >= 0
  end
  
end