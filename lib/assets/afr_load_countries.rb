# encoding: utf-8
require "nkf"
require "countries"

require_relative "./countries/data.rb"

class AfrLoadCountries < ISO3166::Country
  def self.find_country_by_names(names, delimiter: "/")
    ISO3166.configure do |config|
      config.locales = [:ja]
    end
    names.split(delimiter).map do |name|
      name = plastic_country_string(name)
      c = find_country_by_name(name)
      c ||= find_country_by_translated_names(name)
      c ||= Struct.new(:number).new("000")
    end
  end

  def self.plastic_country_string(name)
    name = NKF.nkf("-w -x", name)
  end
end
