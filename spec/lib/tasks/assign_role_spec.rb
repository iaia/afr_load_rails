# encoding: utf-8

require "rails_helper"
require "rake"

describe "assign_role" do
  before(:all) do
    @rake = Rake::Application.new
    Rake.application = @rake
    Rake.application.rake_require(
      "assign_role",
      [Rails.root.join("lib", "tasks")]
    )
    Rake::Task.define_task(:environment)
  end

  describe "assign_role" do
    it "assign" do
      user = FactoryGirl.create(:user)
      user.role = Role.find_by(name: "user")
      user.save!

      @rake["assign_role:assign"].execute(user_id: user.id, role: "admin")
      user.reload
      expect(user.role).to eq Role.find_by(name: "admin")
    end
  end
end
