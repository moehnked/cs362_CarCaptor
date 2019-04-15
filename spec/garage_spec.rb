require "rails_helper"

RSpec.describe Garage do
	it "considers a garage with no cars to be lame" do
		garage = Garage.new
		expect(garage.lame?).to be_truthy
	end
end