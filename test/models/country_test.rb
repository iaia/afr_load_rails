require 'test_helper'

class CountryTest < ActiveSupport::TestCase
    FILE_PATH = Pathname.new(File.dirname(__FILE__)).join("../fixtures/index.html").to_s
    # test "the truth" do
    #   assert true
    # end
    test "add by tv_program" do
        afr = AfrLoad::AfrLoad.new() do |info|
            info.url = FILE_PATH
        end
        afr.get_schedule
        programs = afr.get_program

        country = Country.add_by_tv_program(programs[0])

        assert_equal("アメリカ", country.name)
    end
end
