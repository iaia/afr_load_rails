require "rails_helper"

RSpec.describe "actors/show", type: :view do
  before(:each) do
    @actor = assign(:actor, Actor.create!)
  end

  it "renders attributes in <p>" do
    render
  end
end
