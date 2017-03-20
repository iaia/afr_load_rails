require 'test_helper'

class WatchedMoviesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @watched_movie = watched_movies(:one)
    @current_user = users(:one)
    get "/auth/twitter/callback"
  end

  test "should get index" do
      get watched_movies_url
      assert_response :success
  end

  test "should create watched_movie" do
      assert_difference('WatchedMovie.count') do
          post watched_movies_url, params: { watched_movie: {  } }
      end

      assert_redirected_to watched_movie_url(WatchedMovie.last)
  end

  test "should update watched_movie" do
      patch watched_movie_url(@watched_movie), params: { watched_movie: {watched: false, watched_date: Time.current.to_s(:db)  } }
      assert_redirected_to watched_movie_url(@watched_movie)
  end

  test "should destroy watched_movie" do
      assert_difference('WatchedMovie.count', -1) do
          delete watched_movie_url(@watched_movie)
      end

      assert_redirected_to watched_movies_url
  end
end
