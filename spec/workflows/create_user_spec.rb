require "rails_helper"

RSpec.describe CreateUser do
	it "creates a user given a name" do
		creator = CreateUser.new(username: "Dalton")
		creator.build
		expect(creator.user.username).to eq("Dalton")
	end
end