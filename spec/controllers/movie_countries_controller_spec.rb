require 'rails_helper'

RSpec.describe MovieCountriesController, type: :controller do
  let(:valid_movie_country) do
    movie = create(:movie)
    movie.countries.first
  end

  let(:valid_attributes) do
    movie = create(:movie)
    country = movie.countries.first
    {
      movie_id: movie.id,
      country_code: country.country_code
    }
  end

  let(:invalid_attributes) do
    movie = create(:movie)
    country = movie.countries.first
    {
      movie_id: movie.id,
      country_code: "000"
    }
  end

  let(:valid_session) do
    user = create(:admin)
    {user_id: user.id}
  end

  describe "GET #index" do
    it "returns a success response" do
      movie_country = valid_movie_country
      get :index, params: {}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      movie_country = valid_movie_country
      get :show, params: {id: movie_country.to_param}, session: valid_session
      expect(response).to be_success
    end
  end
end
