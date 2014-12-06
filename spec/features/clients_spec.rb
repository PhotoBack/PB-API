require 'rails_helper'

feature "API Client", :type => :feature do
  scenario "User wants to see overview over the API client" do
    visit "/"

    expect(page).to have_text("API Client")
  end
end
