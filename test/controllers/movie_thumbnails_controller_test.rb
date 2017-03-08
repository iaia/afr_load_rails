require 'test_helper'

class MovieThumbnailsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @movie_thumbnail = movie_thumbnails(:one)
  end

  test "should get index" do
    get movie_thumbnails_url
    assert_response :success
  end

  test "should get new" do
    get new_movie_thumbnail_url
    assert_response :success
  end

  test "should create movie_thumbnail" do
    assert_difference('MovieThumbnail.count') do
      post movie_thumbnails_url, params: { movie_thumbnail: { caption: @movie_thumbnail.caption, file_size: @movie_thumbnail.file_size, movie_id: @movie_thumbnail.movie_id, path: @movie_thumbnail.path, removed: @movie_thumbnail.removed, status: @movie_thumbnail.status, view_status: @movie_thumbnail.view_status } }
    end

    assert_redirected_to movie_thumbnail_url(MovieThumbnail.last)
  end

  test "should show movie_thumbnail" do
    get movie_thumbnail_url(@movie_thumbnail)
    assert_response :success
  end

  test "should get edit" do
    get edit_movie_thumbnail_url(@movie_thumbnail)
    assert_response :success
  end

  test "should update movie_thumbnail" do
    patch movie_thumbnail_url(@movie_thumbnail), params: { movie_thumbnail: { caption: @movie_thumbnail.caption, file_size: @movie_thumbnail.file_size, movie_id: @movie_thumbnail.movie_id, path: @movie_thumbnail.path, removed: @movie_thumbnail.removed, status: @movie_thumbnail.status, view_status: @movie_thumbnail.view_status } }
    assert_redirected_to movie_thumbnail_url(@movie_thumbnail)
  end

  test "should destroy movie_thumbnail" do
    assert_difference('MovieThumbnail.count', -1) do
      delete movie_thumbnail_url(@movie_thumbnail)
    end

    assert_redirected_to movie_thumbnails_url
  end
end
