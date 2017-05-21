# encoding: utf-8

require "rails_helper"
require "rake"

describe "fetch_afr_load" do
  before(:all) do
    @rake = Rake::Application.new
    Rake.application = @rake
    Rake.application.rake_require(
      "fetch_afr_load",
      [Rails.root.join("lib", "tasks")]
    )
    Rake::Task.define_task(:environment)
  end

  describe "get_afr_load_comment" do
    it "returns hoge" do
      @rake["fetch_afr_load:fetch_afr_load"].execute
    end
  end
end
