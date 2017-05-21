require 'rails_helper'

RSpec.describe ActorsController, type: :controller do

  let(:valid_attributes) {
    {
      name: "Steven Frederick Seagal",
      name_ja: "ステーブン・セガール"
    }
  }

  let(:invalid_attributes) {
    {
      name: "",
      name_ja: ""
    }
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # ActorsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  before :each do
    user = User.where(role_id: 3).first 
    session[:user_id] = user.id
    redirect_to "/auth/twitter/callback"
  end

  describe "GET #index" do
    it "returns a success response" do
      actor = Actor.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      actor = Actor.create! valid_attributes
      get :show, params: {id: actor.to_param}, session: valid_session
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
      actor = Actor.create! valid_attributes
      get :edit, params: {id: actor.to_param}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Actor" do
        expect {
          post :create, params: {actor: valid_attributes}, session: valid_session
        }.to change(Actor, :count).by(1)
      end

      it "redirects to the created actor" do
        post :create, params: {actor: valid_attributes}, session: valid_session
        expect(response).to redirect_to(Actor.last)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: {actor: invalid_attributes}, session: valid_session
        expect(response).not_to be_success
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        {
          name: "Steven Frederick Seagal2",
          name_ja: "ステーブン・セガール2"
        }
      }

      it "updates the requested actor" do
        actor = Actor.create! valid_attributes
        put :update, params: {id: actor.to_param, actor: new_attributes}, session: valid_session
        actor.reload
      end

      it "redirects to the actor" do
        actor = Actor.create! valid_attributes
        put :update, params: {id: actor.to_param, actor: valid_attributes}, session: valid_session
        expect(response).to redirect_to(actor)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'edit' template)" do
        actor = Actor.create! valid_attributes
        put :update, params: {id: actor.to_param, actor: invalid_attributes}, session: valid_session
        expect(response).not_to be_success
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested actor" do
      actor = Actor.create! valid_attributes
      expect {
        delete :destroy, params: {id: actor.to_param}, session: valid_session
      }.to change(Actor, :count).by(-1)
    end

    it "redirects to the actors list" do
      actor = Actor.create! valid_attributes
      delete :destroy, params: {id: actor.to_param}, session: valid_session
      expect(response).to redirect_to(actors_url)
    end
  end
end
