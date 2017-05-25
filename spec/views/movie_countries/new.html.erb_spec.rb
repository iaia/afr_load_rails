require 'rails_helper'

RSpec.describe "movie_countries/new", type: :view do
  before(:each) do
    assign(:movie_country, MovieCountry.new())
  end

  it "renders new movie_country form" do
    render

    assert_select "form[action=?][method=?]", movie_countries_path, "post" do
    end
  end
end
