require 'rails_helper'

RSpec.describe "OngoingTasks", type: :request do
  describe "GET /index" do
    it "redirected" do
      get "/dashboard"
      expect(response).to have_http_status(302)
    end
  end

end
