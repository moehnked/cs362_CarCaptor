
class Garage < ApplicationRecord
	belongs_to :user
	has_many :cars
	validates :cars, :user, :garage

	def new(user: User.new)
		@garage = Garage.new

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