# encoding: utf-8
require 'test_helper'
class RoleFlowsTest < ActionDispatch::IntegrationTest
    setup do
        get "/auth/twitter/callback"
        @user = SocialProfile.find_by(uid: "123545").user
    end

    def set_user
        @user.role = roles(:two)
        @user.role.abilities << abilities(:two)
        @user.role.abilities << abilities(:three)
        @user.save
    end

    def set_admin
        @user.role = roles(:one)
        @user.role.abilities << abilities(:one)
        @user.role.abilities << abilities(:two)
        @user.role.abilities << abilities(:three)
        @user.save
    end

    test "index by admin user" do
        set_admin
        get users_path 
        assert_response :success
    end

    test "index by user" do
        set_user
        assert_raise(Pundit::NotAuthorizedError) do
            get users_path 
        end
    end
end
