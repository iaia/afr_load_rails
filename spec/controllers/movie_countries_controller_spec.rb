require 'rails_helper'

RSpec.describe MovieCountriesController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # MovieCountry. As you add validations to MovieCountry, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    {
      movie_id: 1,
      country_code: "840"
    }
  }

  let(:invalid_attributes) {
    {
      movie_id: 1,
      country_code: "000"
    }
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # MovieCountriesController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "returns a success response" do
      movie_country = MovieCountry.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      movie_country = MovieCountry.create! valid_attributes
      get :show, params: {id: movie_country.to_param}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "GET #new" do
    it "returns a success response" do
      get :new, params: {}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "GET #edit" do
    it "returns a success response" do
      movie_country = MovieCountry.create! valid_attributes
      get :edit, params: {id: movie_country.to_param}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new MovieCountry" do
        expect {
          post :create, params: {movie_country: valid_attributes}, session: valid_session
        }.to change(MovieCountry, :count).by(1)
      end

      it "redirects to the created movie_country" do
        post :create, params: {movie_country: valid_attributes}, session: valid_session
        expect(response).to redirect_to(MovieCountry.last)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: {movie_country: invalid_attributes}, session: valid_session
        expect(response).to be_success
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        {
          movie_id: 1,
          country_code: "850"
        }
      }

      it "updates the requested movie_country" do
        movie_country = MovieCountry.create! valid_attributes
        put :update, params: {id: movie_country.to_param, movie_country: new_attributes}, session: valid_session
        movie_country.reload
      end

      it "redirects to the movie_country" do
        movie_country = MovieCountry.create! valid_attributes
        put :update, params: {id: movie_country.to_param, movie_country: valid_attributes}, session: valid_session
        expect(response).to redirect_to(movie_country)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'edit' template)" do
        movie_country = MovieCountry.create! valid_attributes
        put :update, params: {id: movie_country.to_param, movie_country: invalid_attributes}, session: valid_session
        expect(response).to be_success
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested movie_country" do
      movie_country = MovieCountry.create! valid_attributes
      expect {
        delete :destroy, params: {id: movie_country.to_param}, session: valid_session
      }.to change(MovieCountry, :count).by(-1)
    end

    it "redirects to the movie_countries list" do
      movie_country = MovieCountry.create! valid_attributes
      delete :destroy, params: {id: movie_country.to_param}, session: valid_session
      expect(response).to redirect_to(movie_countries_url)
    end
  end

end
