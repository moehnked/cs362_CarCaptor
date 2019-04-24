require "rails_helper"

RSpec.describe Garage do

	describe "adding cars" do
		it "keeps a total of the number of cars" do
			test_garage = Garage.new
			test_garage.add()
			expect(test_garage.car_count).to eq(1)
			test_garage.add()
			expect(test_garage.car_count).to eq(2)
			test_garage.add()
			expect(test_garage.car_count).to eq(3)
		end
	end

	describe "happy path" do
		let(:garage) { Garage.new }
		let(:car) { Car.new }

		it "considers a garage with no cars to be lame", :skip do
			expect(garage).to be_lame
		end

		it "considers a garage with cars to be lame if their total coolness is zero", :skip do
			garage.cars << car
			expect(garage.total_coolness).to eq(1)
		end
	end

	describe "unhappy path" do

	end
end