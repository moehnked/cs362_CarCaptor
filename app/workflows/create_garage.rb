class CreateGarage
	attr_accessor :garage, :user

	def initialize(user: CreateUsers.new().create)
		@user = user
	end

	def success?
		@success
	end

	def build
		self.garage = Garage.new
		garage
	end

	def create
		build
		result = garage.save
		@success = result
	end

end