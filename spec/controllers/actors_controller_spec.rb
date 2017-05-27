require "rails_helper"

RSpec.describe ActorsController, type: :controller do
  let(:valid_actor) do
    create(:actor)
  end

  let(:valid_attributes) do
    attributes_for(:actor)
  end

  let(:invalid_attributes) do
    attributes_for(:actor)
  end

  let(:valid_session) do
    user = create(:admin)
    {user_id: user.id}
  end

  describe "GET #index" do
    it "returns a success response" do
      actor = valid_actor
      get :index, params: {}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      actor = valid_actor
      get :show, params: { id: actor.to_param }, session: valid_session
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
      actor = valid_actor
      get :edit, params: { id: actor.to_param }, session: valid_session
      expect(response).to be_success
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Actor" do
        expect do
          post :create, params: { actor: valid_attributes }, session: valid_session
        end.to change(Actor, :count).by(1)
      end

      it "redirects to the created actor" do
        post :create, params: { actor: valid_attributes }, session: valid_session
        expect(response).to redirect_to(Actor.last)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: { actor: invalid_attributes }, session: valid_session
        expect(response).not_to be_success
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) do
        {
          name: "Steven Frederick Seagal2",
          name_ja: "ステーブン・セガール2"
        }
      end

      it "updates the requested actor" do
        actor = valid_actor
        put :update, params: { id: actor.to_param, actor: new_attributes }, session: valid_session
        actor.reload
      end

      it "redirects to the actor" do
        actor = valid_actor
        put :update, params: { id: actor.to_param, actor: valid_attributes }, session: valid_session
        expect(response).to redirect_to(actor)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'edit' template)" do
        actor = valid_actor
        put :update, params: { id: actor.to_param, actor: invalid_attributes }, session: valid_session
        expect(response).not_to be_success
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested actor" do
      actor = valid_actor
      expect do
        delete :destroy, params: { id: actor.to_param }, session: valid_session
      end.to change(Actor, :count).by(-1)
    end

    it "redirects to the actors list" do
      actor = valid_actor
      delete :destroy, params: { id: actor.to_param }, session: valid_session
      expect(response).to redirect_to(actors_url)
    end
  end
end
