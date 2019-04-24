require "car"

class Garage
	attr_accessor :cars, :total_cars

	def initialize
		@cars = []
		@total_cars = 0
	end

	def total_coolness
		cars.sum(&:coolness_value)
	end

	def add(car = Car.new)
		cars << car
		total_cars += 1
	end

	def lame?
		cars.empty?
	end

	def car_count
		total_cars
	end
end