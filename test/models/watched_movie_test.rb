require "test_helper"

class WatchedMovieTest < ActiveSupport::TestCase
  def setup
    @user = users(:one)
    @movie = movies(:one)
  end

  test "watched movie" do
    watched = @user.watched_movies.build(
      movie_id: @movie.id,
      watched: true,
      watched_date: DateTime.current
    )
    assert_equal(@movie.id, watched.user.id)
    assert(watched.valid?)
    assert(watched.watched)
  end

  test "watched movie duplicate" do
    watched = @user.watched_movies.build(
      movie_id: @movie.id,
      watched: true,
      watched_date: DateTime.current
    )
    watched.save
    assert_equal(@movie.id, watched.user.id)
    assert(watched.valid?)
    assert(watched.watched)

    watched2 = @user.watched_movies.build(
      movie_id: @movie.id,
      watched: true,
      watched_date: DateTime.current
    )
    watched2.save

    assert(watched2.invalid?)
  end
end
