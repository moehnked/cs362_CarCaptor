class User < ApplicationRecord
	validates :username, :password, :email, :garage
	def new
		@user = User.new
	end

end
