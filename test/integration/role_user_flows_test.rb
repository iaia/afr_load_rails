# encoding: utf-8

require "test_helper"
class RoleUserFlowsTest < ActionDispatch::IntegrationTest
  setup do
    get "/auth/twitter/callback"
    @user = SocialProfile.find_by(uid: "123545").user
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

    @user.save
  end

  def set_user
    @user.role = roles(:two)
    @user.role.abilities << abilities(:two)
    @user.role.abilities << abilities(:three)
    @user.save
  end

  test "index by admin user" do
    set_admin
    get users_path
    assert_response :success

    another_user = users(:two)
    get user_path another_user
    assert_response :success

    get edit_user_path another_user
    assert_response :success

    patch user_path another_user,
                    params:
                    {
                      user:
                      {
                        nickname: "iaia_another"
                      }
                    }
    assert_redirected_to user_path(another_user)

    another_user.reload
    assert_equal "iaia_another", another_user.nickname

    assert_difference("User.count", -1) do
      delete user_path another_user
      assert_redirected_to users_path
    end
  end

  test "index by user" do
    set_user
    assert_raise(Pundit::NotAuthorizedError) do
      get users_path
    end

    assert_no_difference("User.count") do
      assert_raise(Pundit::NotAuthorizedError) do
        post users_path,
             params:
             {
               user: {
                 name: "iaia",
                 nickname: "iaia_another"
               }
             }
      end
    end

    another_user = users(:one)
    assert_raise(Pundit::NotAuthorizedError) do
      get user_path another_user
    end

    assert_raise(Pundit::NotAuthorizedError) do
      get edit_user_path another_user
    end

    orig_nickname = another_user.nickname

    assert_raise(Pundit::NotAuthorizedError) do
      patch user_path another_user,
                      params:
                      {
                        user:
                        {
                          nickname: "iaia_another"
                        }
                      }
    end

    another_user.reload

    assert_equal orig_nickname, another_user.nickname

    assert_raise(Pundit::NotAuthorizedError) do
      delete user_path another_user
    end
  end
end
