require 'rails_helper'

RSpec.describe "Friendships", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/friendship/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /discover" do
    it "returns http success" do
      get "/friendship/discover"
      expect(response).to have_http_status(:success)
    end
  end

end
