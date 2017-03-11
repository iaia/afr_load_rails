require 'test_helper'

class ActorsControllerTest < ActionDispatch::IntegrationTest
    def setup
        @actor = actors(:one)
    end

    test "should get index" do
        get actors_path
        assert_response :success
    end

    test "should get show" do
        get actor_path @actor
        assert_response :success
    end

    test "should get edit" do
        get edit_actor_path @actor
        assert_response :success
    end

    test "should post update" do
        patch actor_path @actor, params: {actor: {name: "Steve Buscemi"}}
        assert_redirected_to actor_path @actor
    end

end