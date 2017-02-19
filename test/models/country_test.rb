require 'test_helper'

class CountryTest < ActiveSupport::TestCase
    FILE_PATH = Pathname.new(File.dirname(__FILE__)).join("../fixtures/index.html")
    # test "the truth" do
    #   assert true
    # end
    test "add by tv_program" do
        afr = AfrLoad::AfrLoad.new()
        afr.get_schedule_from_file(File.open(FILE_PATH))
        programs = afr.get_program

        country = Country.add_by_tv_program(programs[0])

        assert_equal("アメリカ", country.name)
    end
end
