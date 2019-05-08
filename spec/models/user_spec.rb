require 'rails_helper'

RSpec.describe User, type: :model do
  let (:user) do
		user = User.new
		user.setup(username: "test", password: "testpass", email: "test@email.com")
	
	it "expects new user to have username, password, email and garage" do
		expect(user.username).to eq("test")
		expect(user.password).to eq("testpass")
		expect(user.email).to eq("test@email.com")
		expect(user.garage).to be_truthy()
		expect(user.garage).to be_a(Garage)
	end
	end
end
