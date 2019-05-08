class UsersController < ApplicationController
	def new
		@user = User.new
	end

	def index
		@users = User.all
	end

	def show
		@user = User.find(params[:id])
	end

	def create
		user = User.create(
			username: params[:user][:username], 
			password: params[:user][:password], 
			email: params[:user][:email])
		user.garage = Garage.create(user: user)
		user.garage.setup(user: user)
		user.garage.save 
		if user.save
			redirect_to user_path(user)
		else
			render :new
		end
	end
end
