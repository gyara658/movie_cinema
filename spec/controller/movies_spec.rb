require 'rails_helper'

RSpec.describe "Movies", type: :request do
  describe "#index" do
    context "root page" do
      it "root page" do
        get "/"
        expect(response).to have_http_status("200")
      end
    end
  end
end
