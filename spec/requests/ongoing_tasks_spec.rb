require 'rails_helper'

RSpec.describe "OngoingTasks", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/ongoing_tasks/index"
      expect(response).to have_http_status(:success)
    end
  end

end
