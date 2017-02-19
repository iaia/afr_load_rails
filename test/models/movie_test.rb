require 'test_helper'

class MovieTest < ActiveSupport::TestCase
    FILE_PATH = Pathname.new(File.dirname(__FILE__)).join("../fixtures/index.html")
    test "add by tv_program" do
        afr = AfrLoad::AfrLoad.new()
        afr.get_schedule_from_file(File.open(FILE_PATH))
        programs = afr.get_program

        movie = Movie.add_by_tv_program(programs[0])

        assert_equal("THE TUXEDO", movie.title)
        assert_equal("タキシード", movie.title_ja)
        assert_equal("ジャッキー・チェン", movie.actors[0].name_ja)
        assert_equal("ジェニファー・ラブ・ヒューイット", movie.actors[1].name_ja)
        assert_equal("ケビン・ドノバン", movie.director.name_ja)
        assert_equal("アメリカ", movie.country.name)
        assert_equal(2002, movie.released_year)
    end
end
