require "test_helper"

class TvProgramTest < ActiveSupport::TestCase
  FILE_PATH =
    Pathname.new(File.dirname(__FILE__))
            .join("../fixtures/index.html").to_s
  test "add one by tv_program" do
    afr = AfrLoad::AfrLoad.new do |info|
      info.url = FILE_PATH
    end
    afr.get_schedule
    programs = afr.get_program

    movie = Movie.add_by_tv_program(programs[0])
    tv = TvProgram.add(programs[0], movie)

    assert_equal("2017/04/03", tv.on_air_date.strftime("%Y/%m/%d"))
    assert_equal("WHITE HOUSE DOWN", tv.title)
    assert_equal("ホワイトハウス・ダウン", tv.title_ja)
    assert_equal("アメリカ", tv.country.name)
    assert_equal("ローランド・エメリッヒ", tv.director.name_ja)
    assert_equal(2013, tv.released_year)
    assert_equal("チャニング・テイタム", tv.leading_actor.name_ja)
    assert_equal("ジェイミー・フォックス", tv.supporting_actor.name_ja)
    assert_equal(movie.id, tv.movie.id)
  end

  test "add by tv_program" do
    afr = AfrLoad::AfrLoad.new do |info|
      info.url = FILE_PATH
    end
    afr.get_schedule
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
