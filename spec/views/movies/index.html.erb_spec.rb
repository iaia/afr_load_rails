require "rails_helper"

RSpec.describe "movies/index", type: :view do
  before(:each) do
    user = create(:admin)
    allow(view).to receive(:current_user).and_return(user)

    movie = create(:movie)
    movie2 = create(:movie, title: "Back to the Future2")
    assign(:movies, Movie.all)
  end

  it "renders a list of movies" do
    render
  end
end
