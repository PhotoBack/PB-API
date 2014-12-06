require 'rails_helper'

RSpec.describe User, :type => :model do
  describe "Omniauth" do
    before do
      User.create(:provider => 'google_oauth2', :uid => "777", :email => 'existing@example.com')
    end

    subject { OmniAuth::AuthHash.new(:provider => 'google_oauth2',
                                     :uid => '1234',
                                     :info => { :email => 'test@example.com' })}
    it "gets creates a new user if the given user does not exist" do
      user = User.from_omniauth(subject)

      expect(user.email).to eq('test@example.com')
      expect(User.count).to eq(2)
    end

    it "returns the current user if it already exists" do
      existing_user = subject
      existing_user.uid = "777"
      existing_user.info.email = "existing@example.com"

      user = User.from_omniauth(existing_user)

      expect(user.email).to eq('existing@example.com')
      expect(User.count).to eq(1)
    end
  end
end
