require 'test_helper'

class ActorThumbnailsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @actor_thumbnail = actor_thumbnails(:one)
  end

  test "should get index" do
    get actor_thumbnails_url
    assert_response :success
  end

  test "should get new" do
    get new_actor_thumbnail_url
    assert_response :success
  end

  test "should create actor_thumbnail" do
    assert_difference('ActorThumbnail.count') do
      post actor_thumbnails_url, params: { actor_thumbnail: { actor_id: @actor_thumbnail.actor_id, caption: @actor_thumbnail.caption, file_size: @actor_thumbnail.file_size, path: @actor_thumbnail.path, removed: @actor_thumbnail.removed, status: @actor_thumbnail.status, view_status: @actor_thumbnail.view_status } }
    end

    assert_redirected_to actor_thumbnail_url(ActorThumbnail.last)
  end

  test "should show actor_thumbnail" do
    get actor_thumbnail_url(@actor_thumbnail)
    assert_response :success
  end

  test "should get edit" do
    get edit_actor_thumbnail_url(@actor_thumbnail)
    assert_response :success
  end

  test "should update actor_thumbnail" do
    patch actor_thumbnail_url(@actor_thumbnail), params: { actor_thumbnail: { actor_id: @actor_thumbnail.actor_id, caption: @actor_thumbnail.caption, file_size: @actor_thumbnail.file_size, path: @actor_thumbnail.path, removed: @actor_thumbnail.removed, status: @actor_thumbnail.status, view_status: @actor_thumbnail.view_status } }
    assert_redirected_to actor_thumbnail_url(@actor_thumbnail)
  end

  test "should destroy actor_thumbnail" do
    assert_difference('ActorThumbnail.count', -1) do
      delete actor_thumbnail_url(@actor_thumbnail)
    end

    assert_redirected_to actor_thumbnails_url
  end
end
