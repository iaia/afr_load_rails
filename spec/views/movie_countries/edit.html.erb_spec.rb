require 'rails_helper'

RSpec.describe "movie_countries/edit", type: :view do
  before(:each) do
    @movie_country = assign(:movie_country, MovieCountry.create!())
  end

  it "renders the edit movie_country form" do
    render

    assert_select "form[action=?][method=?]", movie_country_path(@movie_country), "post" do
    end
  end
end
