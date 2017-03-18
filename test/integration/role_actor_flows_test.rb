# encoding: utf-8
require 'test_helper'
class RoleActorFlowsTest < ActionDispatch::IntegrationTest
    setup do
        get "/auth/twitter/callback"
        @user = SocialProfile.find_by(uid: "123545").user
        @actor = actors(:one)
        @actor.movies << movies(:one)
        @actor.save
    end

    def set_admin
        @user.role = roles(:one)
        @user.role.abilities << abilities(:one)
        @user.role.abilities << abilities(:two)
        @user.role.abilities << abilities(:three)
        @user.role.abilities << abilities(:four)
        @user.role.abilities << abilities(:five)
        @user.role.abilities << abilities(:six)
        @user.role.abilities << abilities(:seven)
        @user.role.abilities << abilities(:eight)
        @user.role.abilities << abilities(:nine)
        @user.role.abilities << abilities(:ten)
        @user.role.abilities << abilities(:eleven)
        @user.role.abilities << abilities(:twelve)

        @user.save
    end

    def set_user
        @user.role = roles(:two)
        @user.role.abilities << abilities(:two)
        @user.role.abilities << abilities(:three)
        @user.save
    end

    test "actor by admin" do
        set_admin
        get actors_path 
        assert_response :success

        get actor_path @actor
        assert_response :success

        get edit_actor_path @actor
        assert_response :success

        patch actor_path @actor, params: { actor: {name: "iaia_title" } }
        assert_redirected_to actor_path(@actor)
        @actor.reload
        assert_equal "iaia_title", @actor.name 

    end

    test "actor by user" do
        set_user
        get actors_path
        assert_response :success

        get actor_path @actor
        assert_response :success

        assert_raise(Pundit::NotAuthorizedError) do
            get edit_actor_path @actor
        end

        orig_title = @actor.name

        assert_raise(Pundit::NotAuthorizedError) do
            patch actor_path @actor, params: { actor: {name: "iaia_title" } }
        end

        @actor.reload

        assert_equal orig_title, @actor.name 

    end
end
