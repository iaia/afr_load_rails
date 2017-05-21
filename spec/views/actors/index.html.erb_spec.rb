require "rails_helper"

RSpec.describe "actors/index", type: :view do
  before(:each) do
    assign(:actors, [
             Actor.create!,
             Actor.create!
           ])
  end

  it "renders a list of actors" do
    render
  end
end
