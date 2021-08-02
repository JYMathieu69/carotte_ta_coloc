require 'rails_helper'

RSpec.describe "Pages", type: :request do
  describe "GET /home" do
    it "returns http success" do
      get "/home"
      expect(response).to have_http_status(302)
    end
  end

end
