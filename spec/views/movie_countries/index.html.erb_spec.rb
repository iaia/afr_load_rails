require 'rails_helper'

RSpec.describe "movie_countries/index", type: :view do
  before(:each) do
    movie = create(:movie)
    assign(:movie_countries, movie.countries)
  end

  it "renders a list of movie_countries" do
    render
  end
end
