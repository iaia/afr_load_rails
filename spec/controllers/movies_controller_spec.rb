require 'rails_helper'

RSpec.describe MoviesController, type: :controller do
  before :each do
    user = User.where(role_id: 3).first 
    session[:user_id] = user.id
    redirect_to "/auth/twitter/callback"
  end

  describe 'GET #new' do
    it "assigns the requrested new movie to @movie" do
      get :new
      expect(response.status).to eq(200)
    end
  end

  describe "POST #create" do
    it "create movie" do
      post :create, movie: {
        title: "Back to the Future", title_ja: "バック・トゥ・ザ・フューチャー",
        director_id: -1, country_id: -1,
        released_year: 1985, released_country: -1,
        story: ""
      }

      expect(response.status).to eq(200)
    end
  end
end

