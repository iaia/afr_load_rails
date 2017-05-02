# encoding: utf-8
require "rails_helper"
require "rake"

describe "get_afr_load_comment_tweet" do
    before(:all) do
        @rake = Rake::Application.new
        Rake.application = @rake
        Rake.application.rake_require('get_afr_load_comment_tweet', ["#{Rails.root}/lib/tasks"])
        Rake::Task.define_task(:environment)
    end

    describe "get_afr_load_comment" do
        it 'returns hoge' do
            @rake["get_afr_load_comment_tweet:get_afr_load_comment_tweet"].execute

        end
    end
end
