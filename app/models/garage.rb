class Garage
	attr_accessor :cars

	def initialize
		@cars = []
	end

	def total_coolness
		cars.sum(&:coolness_value)
	end

	def lame?
		cars.empty?
	end
end