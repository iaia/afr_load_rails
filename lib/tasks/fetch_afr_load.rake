# encoding: utf-8

require "assets/fetch_afr_load"

namespace :fetch_afr_load do
  desc "月1で午後ローから取得して保存する"
  task fetch_afr_load: :environment do
    programs = AfrLoad::AfrLoad.get_schedule
    programs.each do |program|
      f = FetchAfrLoad.new(program)
      Rails.application.config.fetch_afr_load_log.info("save_program #{f.program.values}")
      f.save_program
    end
  end
end
