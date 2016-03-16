require "rails_helper"

RSpec.feature "Signing out signed-in users" do
  
  before do
    @john = User.create!(email: "john@example.com", password: "password")
    visit "/"
    click_link "Log in"
    fill_in "Email", with: @john.email
    fill_in "Password", with: @john.password
    click_button "Log in"
  end
  
  scenario do
    visit "/"
    click_link "Log Out"
    expect(page).to have_content("Signed out successfully")
  end
  
end
