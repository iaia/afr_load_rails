require 'rails_helper'

RSpec.describe "movie_countries/show", type: :view do
  before(:each) do
    @movie_country = assign(:movie_country, MovieCountry.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
