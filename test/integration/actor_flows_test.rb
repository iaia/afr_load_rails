require 'test_helper'

class ActorFlowsTest < ActionDispatch::IntegrationTest
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
        new_name = "Steve Buscemi"
        new_name_ja = "スティーブ・ブシェミ"
        patch actor_path @actor, params: {actor: {name: new_name, name_ja: new_name_ja}}
        assert_redirected_to actor_path @actor
        @actor.reload
        assert_equal new_name, @actor.name
        assert_equal new_name_ja, @actor.name_ja
    end
end
