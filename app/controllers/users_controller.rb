class UsersController < ApplicationController
	def new
		@user = User.new
	end

	def index
		@users = User.all
	end

	def create
	    @workflow = CreateUser.new(username: params[:user][:username], password: params[:user][:password], email: params[:user][:email])
	    @workflow.create
	    if @workflow.success?
	      redirect_to users_path
	    else
	      @user = @workflow.user
	      render :new
	    end
	end
end
