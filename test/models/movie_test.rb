require "test_helper"

class MovieTest < ActiveSupport::TestCase
  FILE_PATH =
    Pathname.new(File.dirname(__FILE__))
            .join("../fixtures/index.html").to_s

  test "add by tv_program" do
    afr = AfrLoad::AfrLoad.new do |info|
      info.url = FILE_PATH
    end
    afr.get_schedule
    programs = afr.get_program

    movie = Movie.add_by_tv_program(programs[0])

    assert_equal("WHITE HOUSE DOWN", movie.title)
    assert_equal("ホワイトハウス・ダウン", movie.title_ja)
    assert_equal("チャニング・テイタム", movie.actors[0].name_ja)
    assert_equal("ジェイミー・フォックス", movie.actors[1].name_ja)
    assert_equal("ローランド・エメリッヒ", movie.director.name_ja)
    assert_equal("アメリカ", movie.country.name)
    assert_equal(2013, movie.released_year)
  end
end
