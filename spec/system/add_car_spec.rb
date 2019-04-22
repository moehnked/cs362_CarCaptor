require "rails_helper"

RSpec.describe "adding a car", type: :system do
  it "allows a user to create a car" do
    visit new_car_path
    fill_in "Year", with: "1999"
    fill_in "Make", with: "Ford"
    fill_in "Model", with: "Mustang"
    fill_in "Coolness value", with: 5
    click_on("Create Car")
    visit cars_path
    expect(page).to have_content(1999)
    expect(page).to have_content("Ford")
    expect(page).to have_content("Mustang")
    expect(page).to have_content(5)
  end
end