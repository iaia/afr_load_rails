require 'test_helper'

class ActorTest < ActiveSupport::TestCase
    FILE_PATH = Pathname.new(File.dirname(__FILE__)).join("../fixtures/index.html")
    test "add by tv_program" do
        afr = AfrLoad::AfrLoad.new()
        afr.get_schedule_from_file(File.open(FILE_PATH))
        programs = afr.get_program

        actors = Actor.add_by_tv_program(programs[0])
        
        assert_equal("ジャッキー・チェン", actors[0].name_ja)
        assert_equal("ジェニファー・ラブ・ヒューイット", actors[1].name_ja)
    end
end
