# encoding: utf-8
require "assets/fetch_afr_load"

namespace :fetch_afr_load do
    desc "月1で午後ローから取得して保存する"
    task :fetch_afr_load => :environment do
        f = FetchAfrLoad.new()
        f.fetch()
    end
end
