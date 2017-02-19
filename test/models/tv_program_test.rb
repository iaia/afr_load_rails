require 'test_helper'

class TvProgramTest < ActiveSupport::TestCase
    FILE_PATH = Pathname.new(File.dirname(__FILE__)).join("../fixtures/index.html")
    test "add one by tv_program" do
        afr = AfrLoad::AfrLoad.new()
        afr.get_schedule_from_file(File.open(FILE_PATH))
        programs = afr.get_program

        movie = Movie.add_by_tv_program(programs[0])
        tv = TvProgram.add(programs[0], movie)
        
        assert_equal("2017/01/04", tv.on_air_date.strftime("%Y/%m/%d"))
        assert_equal("THE TUXEDO", tv.title)
        assert_equal("タキシード", tv.title_ja)
        assert_equal("アメリカ", tv.country.name)
        assert_equal("ケビン・ドノバン", tv.director.name_ja)
        assert_equal(2002, tv.released_year)
        assert_equal("ジャッキー・チェン", tv.leading_actor.name_ja)
        assert_equal("ジェニファー・ラブ・ヒューイット", tv.supporting_actor.name_ja)
        assert_equal(movie.id, tv.movie.id)
    end

    test "add by tv_program" do
        afr = AfrLoad::AfrLoad.new()
        afr.get_schedule_from_file(File.open(FILE_PATH))
        programs = afr.get_program

        programs.each do |program|
            movie = Movie.add_by_tv_program(program)
            tv = TvProgram.add(program, movie)
            assert_not_nil(tv.on_air_date.strftime("%Y/%m/%d"))
            assert_not_nil(tv.title)
            assert_not_nil(tv.title_ja)
            assert_not_nil(tv.director.name_ja)
            assert_not_nil(tv.released_year)
            assert_not_nil(tv.country.name)
            assert_not_nil(tv.leading_actor.name_ja)
            assert_not_nil(tv.supporting_actor.name_ja)
        end
    end
end
