require 'rails_helper'

RSpec.describe "movie_countries/index", type: :view do
  before(:each) do
    assign(:movie_countries, [
      MovieCountry.create!(),
      MovieCountry.create!()
    ])
  end

  it "renders a list of movie_countries" do
    render
  end
end
