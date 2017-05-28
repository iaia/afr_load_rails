require 'rails_helper'

RSpec.describe "MovieCountries", type: :request do
  describe "GET /movie_countries" do
    it "works! (now write some real specs)" do
      get movie_countries_path
      expect(response).to have_http_status(200)
    end
  end
end
