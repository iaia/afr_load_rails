# encoding: utf-8

require "assets/comment_getter"

namespace :get_comment do
  desc "get comment everyday."
  task get_afr_load_comment: :environment do |_task, args|
    now = DateTime.current
    puts "get afr_load_comment start #{now}"
    # now = DateTime.new(2017, 5, 1, 04, 04)

    args = {}
    args[:tv_name] = "午後のロードショー"
    args[:provider] = "Twitter"

    com = CommentGetter::CommentGetter.new(now, args[:tv_name], args[:provider])
    com.start
  end
end
