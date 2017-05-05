require "test_helper"

class MovieFlowsTest < ActionDispatch::IntegrationTest
  def setup
    @movie = movies(:one)
    @movie.director = directors(:one)
    @movie.country = countries(:one)
    @movie.save
  end

  test "should get index" do
    get movies_path
    assert_response :success
  end

  test "should get show" do
    get movie_path @movie
    assert_response :success
  end

  test "should get edit" do
    assert_raise(Pundit::NotAuthorizedError) do
      get edit_movie_path @movie
    end
  end

  test "should post update" do
    new_title = @movie.title + "aaa"
    new_title_ja = @movie.title_ja + "aaaaa:"
    assert_raise(Pundit::NotAuthorizedError) do
      patch movie_path @movie,
                       params:
                       {
                         movie:
                         {
                           title: new_title,
                           title_ja: new_title_ja
                         }
                       }
    end
    @movie.reload
    assert_not_equal new_title, @movie.title
    assert_not_equal new_title_ja, @movie.title_ja
  end
end
