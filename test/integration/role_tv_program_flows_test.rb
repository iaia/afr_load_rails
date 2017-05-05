# encoding: utf-8

require "test_helper"
class RoleTvProgramFlowsTest < ActionDispatch::IntegrationTest
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

  test "tv program by admin" do
    set_admin
    get tv_programs_path
    assert_response :success
  end

  test "tv program by user" do
    set_user
    get tv_programs_path
    assert_response :success
  end
end
