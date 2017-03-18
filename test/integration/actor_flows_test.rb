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
        assert_raise(Pundit::NotAuthorizedError) do
            get edit_actor_path @actor
        end
    end

    test "should post update" do
        new_name = "Steve Buscemi"
        assert_raise(Pundit::NotAuthorizedError) do
            patch actor_path @actor, params: {actor: {name: new_name}}
        end

        @actor.reload
        assert_not_equal new_name, @actor.name
    end


end
