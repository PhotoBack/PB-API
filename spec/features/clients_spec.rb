require 'rails_helper'

feature "API Client", :type => :feature do
  scenario "Fresh user visit the site" do
    visit "/"

    expect(page).to have_text("API Client")
    expect(page).to have_text("Sign in")
  end
end
