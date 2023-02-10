require 'rails_helper'

RSpec.describe "Homepages", type: :request do
  let (:user) { User.create(email: 'test@mailer.com', password: 'password', password_confirmation: 'password') }
  describe "GET /index" do
    before do
      sign_in user
    end

    it "returns http success" do
      get root_path
      expect(response).to have_http_status(:success)
    end

    it "renders the index template" do
      get root_path
      expect(response).to render_template("index")
    end
  end

end
