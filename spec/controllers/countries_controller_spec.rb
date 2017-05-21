require 'rails_helper'

RSpec.describe CountriesController, type: :controller do

  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  let(:valid_session) { {} }

  describe "GET #index" do
    it "returns a success response" do
      country = Country.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      country = Country.create! valid_attributes
      get :show, params: {id: country.to_param}, session: valid_session
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
      country = Country.create! valid_attributes
      get :edit, params: {id: country.to_param}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Country" do
        expect {
          post :create, params: {country: valid_attributes}, session: valid_session
        }.to change(Country, :count).by(1)
      end

      it "redirects to the created country" do
        post :create, params: {country: valid_attributes}, session: valid_session
        expect(response).to redirect_to(Country.last)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: {country: invalid_attributes}, session: valid_session
        expect(response).to be_success
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested country" do
        country = Country.create! valid_attributes
        put :update, params: {id: country.to_param, country: new_attributes}, session: valid_session
        country.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the country" do
        country = Country.create! valid_attributes
        put :update, params: {id: country.to_param, country: valid_attributes}, session: valid_session
        expect(response).to redirect_to(country)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'edit' template)" do
        country = Country.create! valid_attributes
        put :update, params: {id: country.to_param, country: invalid_attributes}, session: valid_session
        expect(response).to be_success
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested country" do
      country = Country.create! valid_attributes
      expect {
        delete :destroy, params: {id: country.to_param}, session: valid_session
      }.to change(Country, :count).by(-1)
    end

    it "redirects to the countries list" do
      country = Country.create! valid_attributes
      delete :destroy, params: {id: country.to_param}, session: valid_session
      expect(response).to redirect_to(countries_url)
    end
  end

end
