require "rails_helper"

RSpec.describe Garage do
  it "a garage needs to initialize with empty spots" do
    garage = Garage.new
    expect(garage.spots).to be_empty
  end
  
end