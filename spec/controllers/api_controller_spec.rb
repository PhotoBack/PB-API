require 'rails_helper'

RSpec.describe ApiController, :type => :controller do

  describe "POST upload" do
    let(:user) { FactoryGirl.create(:user) }

    before do
      sign_in user
    end

    it "requires a logged in user" do
      sign_out user

      post :upload, {:file => 'config/routes.rb'}

      expect(response).to have_http_status(302)
    end

    it "uploads the given file" do
      expect {
        post :upload, {:file => File.open('config/routes.rb').read()}
      }.to change{user.images.count}.by(1)
    end
  end

end
