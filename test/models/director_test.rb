require 'test_helper'

class DirectorTest < ActiveSupport::TestCase
    FILE_PATH = Pathname.new(File.dirname(__FILE__)).join("../fixtures/index.html")
    test "add by tv_program" do
        afr = AfrLoad::AfrLoad.new()
        afr.get_schedule_from_file(File.open(FILE_PATH))
        programs = afr.get_program

        director = Director.add_by_tv_program(programs[0])

        assert_equal("ケビン・ドノバン", director.name_ja)
    end
end
