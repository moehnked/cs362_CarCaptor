class User < ApplicationRecord
  belongs_to :garage 
  #attr_accessor :username, :email, :garage

  def setup(params)
  	self.username = params.fetch(:username, "default_username")
  	self.password = params.fetch(:password, "default_password")
  	self.email = params.fetch(:email, "default@email.com")
  	self.garage = Garage.new(user: self)
  end
end
