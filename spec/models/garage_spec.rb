require "rails_helper"

RSpec.describe Garage do
	let(:garage) { Garage.new }
	let(:car) { Car.new }

	it "considers a garage with no cars to be lame" do
		expect(garage).to be_lame
	end

	it "considers a garage with cars to be lame if their total coolness is zero" do
		garage.cars << car
		expect(garage.total_coolness).to eq(1)
	end
end