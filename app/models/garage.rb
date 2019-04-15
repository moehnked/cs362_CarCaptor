class Garage
	attr_accessor :cars

	def initialize
		@cars = []
	end

	def lame?
		cars.empty?
	end
end