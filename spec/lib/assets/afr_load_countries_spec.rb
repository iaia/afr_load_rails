# encoding: utf-8

require "rails_helper"
require "assets/afr_load_countries.rb"

describe "afr_load_countries" do
  describe "find_country_by_names" do
    it "アメリカ合衆国" do
      c = AfrLoadCountries.find_country_by_names("アメリカ合衆国")
      expect(c.first.number).to eq "840"
    end

    it "not exist country" do
      c = AfrLoadCountries.find_country_by_names("iaia合衆国")
      expect(c.first.number).to eq "000"
    end

    it "multiple" do
      cs = AfrLoadCountries.find_country_by_names("アメリカ合衆国/日本")
      expect(cs[0].number).to eq "840"
      expect(cs[1].number).to eq "392"
    end

    it "アメリカ" do
      c = AfrLoadCountries.find_country_by_names("アメリカ")
      expect(c.first.number).to eq "840"
    end
  end
end
