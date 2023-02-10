require 'rails_helper'

RSpec.describe "Analytics", type: :request do
    let (:user) { User.create(email: 'test@mailer.com', password: 'password', password_confirmation: 'password', admin: true) }
    
  describe "GET /index" do
    before do
      sign_in user
    end
    it "returns http success" do
      get "/analytics"
      expect(response).to have_http_status(:success)
    end
  end

end
