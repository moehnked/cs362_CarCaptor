require "car"

class Garage
	attr_accessor :cars

	def initialize
		@cars = []
	end

	def total_coolness
		cars.sum(&:coolness_value)
	end

	def add(car = Car.new)
		cars << car
	end

	def lame?
		cars.empty?
	end

	def car_count
		cars.size
	end
end