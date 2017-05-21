require "rails_helper"

RSpec.describe MoviesController, type: :controller do
  let(:valid_attributes) do
    {
      title: "THE TUXEDO",
      title_ja: "タキシード",
      director_id: 1,
      country_id: 1,
      released_year: 2002,
      released_country: 1,
      story: "arasuji"
    }
  end

  let(:invalid_attributes) do
    {
      title: "",
      title_ja: "タキシード",
      director: 1,
      released_year: 2002,
      country_id: 1
    }
  end

  let(:valid_session) { {} }

  before :each do
    user = User.where(role_id: 3).first
    session[:user_id] = user.id
    redirect_to "/auth/twitter/callback"
  end

  describe "GET #index" do
    it "returns a success response" do
      movie = Movie.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      movie = Movie.create! valid_attributes
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
      movie = Movie.create! valid_attributes
      get :edit, params: { id: movie.to_param }, session: valid_session
      expect(response).to be_success
    end
  end

  describe "POST #create" do
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
          title: "THE TUXEDO2",
          title_ja: "タキシード2",
          director_id: 1,
          country_id: 1,
          released_year: 2012,
          released_country: 1,
          story: "arasuji2"
        }
      end

      it "updates the requested movie" do
        movie = Movie.create! valid_attributes
        put :update, params: { id: movie.to_param, movie: new_attributes }, session: valid_session
        movie.reload
      end

      it "redirects to the movie" do
        movie = Movie.create! valid_attributes
        put :update, params: { id: movie.to_param, movie: valid_attributes }, session: valid_session
        expect(response).to redirect_to(movie)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'edit' template)" do
        movie = Movie.create! valid_attributes
        put :update, params: { id: movie.to_param, movie: invalid_attributes }, session: valid_session
        expect(response).not_to be_success
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested movie" do
      movie = Movie.create! valid_attributes
      expect do
        delete :destroy, params: { id: movie.to_param }, session: valid_session
      end.to change(Movie, :count).by(-1)
    end

    it "redirects to the movies list" do
      movie = Movie.create! valid_attributes
      delete :destroy, params: { id: movie.to_param }, session: valid_session
      expect(response).to redirect_to(movies_url)
    end
  end
end
