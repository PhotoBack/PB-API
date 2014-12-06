require 'rails_helper'
require 'support/omni_auth'

feature "API Client", :type => :feature do
  scenario "User logs in with Google" do
    visit "/"

    expect(page).to have_text("API Client")
    expect(page).to have_text("Sign in")

    click_link "Sign in with Google"

    expect(page).to have_text("Hi example@example.com")
  end
end
