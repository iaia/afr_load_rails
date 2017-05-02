require 'test_helper'

class ActorTest < ActiveSupport::TestCase
    FILE_PATH = Pathname.new(File.dirname(__FILE__)).join("../fixtures/index.html").to_s
    test "add by tv_program" do
        afr = AfrLoad::AfrLoad.new() do |info|
            info.url = FILE_PATH
        end
        afr.get_schedule
        programs = afr.get_program

        actors = Actor.add_by_tv_program(programs[0])

        assert_equal("チャニング・テイタム", actors[0].name_ja)
        assert_equal("ジェイミー・フォックス", actors[1].name_ja)
    end
end
