# encoding: utf-8

require "test_helper"
class RoleDirectorFlowsTest < ActionDispatch::IntegrationTest
  setup do
    get "/auth/twitter/callback"
    @user = SocialProfile.find_by(uid: "123545").user
    @director = directors(:one)
    @director.movies << movies(:one)
    @director.movies << movies(:two)
    @director.save
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
    @user.role.abilities << abilities(:thirty)
    @user.role.abilities << abilities(:fourty)

    @user.save
  end

  def set_user
    @user.role = roles(:two)
    @user.role.abilities << abilities(:two)
    @user.role.abilities << abilities(:three)
    @user.save
  end

  test "director by admin" do
    set_admin
    get directors_path
    assert_response :success

    get director_path @director
    assert_response :success

    get edit_director_path @director
    assert_response :success

    patch director_path @director,
                        params:
                        {
                          director:
                          {
                            name: "iaia_title"
                          }
                        }
    assert_redirected_to director_path(@director)
    @director.reload
    assert_equal "iaia_title", @director.name
  end

  test "director by user" do
    set_user
    get directors_path
    assert_response :success

    get director_path @director
    assert_response :success

    assert_raise(Pundit::NotAuthorizedError) do
      get edit_director_path @director
    end

    orig_title = @director.name

    assert_raise(Pundit::NotAuthorizedError) do
      patch director_path @director,
                          params:
                          {
                            director:
                            {
                              name: "iaia_title"
                            }
                          }
    end

    @director.reload

    assert_equal orig_title, @director.name
  end
end
