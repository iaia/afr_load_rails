require "rails_helper"

RSpec.describe MoviesController, type: :controller do
  let(:valid_movie) do
    create(:movie)
  end

  let(:valid_attributes) do
    attributes_for(:movie)
  end

  let(:invalid_attributes) do
    attributes_for(:movie, title: "")
  end

  let(:valid_session) do
    user = create(:admin)
    {user_id: user.id}
  end


  describe "GET #index" do
    it "returns a success response" do
      movie = valid_movie
      get :index, params: {}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      movie = valid_movie
      get :show, params: { id: movie.to_param }, session: valid_session
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
      movie = valid_movie
      get :edit, params: { id: movie.to_param }, session: valid_session
      expect(response).to be_success
    end
  end

  describe "POST #create" do
    let(:valid_attributes) do
      attributes_for(:movie)
    end


    context "with valid params" do
      it "creates a new Movie" do
        expect do
          post :create, params: { movie: valid_attributes }, session: valid_session
        end.to change(Movie, :count).by(1)
      end

      it "redirects to the created movie" do
        post :create, params: { movie: valid_attributes }, session: valid_session
        expect(response).to redirect_to(Movie.last)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: { movie: invalid_attributes }, session: valid_session
        expect(response).not_to be_success
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) do
        {
          title: "Back to the Future 2",
          title_ja: "バック・トゥ・ザ・フューチャー2"
        }
      end

      it "updates the requested movie" do
        movie = valid_movie
        put :update, params: { id: movie.to_param, movie: new_attributes }, session: valid_session
        movie.reload
      end

      it "redirects to the movie" do
        movie = valid_movie
        put :update, params: { id: movie.to_param, movie: valid_attributes }, session: valid_session
        expect(response).to redirect_to(movie)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'edit' template)" do
        movie = valid_movie
        put :update, params: { id: movie.to_param, movie: invalid_attributes }, session: valid_session
        expect(response).not_to be_success
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested movie" do
      movie = valid_movie
      expect do
        delete :destroy, params: { id: movie.to_param }, session: valid_session
      end.to change(Movie, :count).by(-1)
    end

    it "redirects to the movies list" do
      movie = valid_movie
      delete :destroy, params: { id: movie.to_param }, session: valid_session
      expect(response).to redirect_to(movies_url)
    end
  end
end
