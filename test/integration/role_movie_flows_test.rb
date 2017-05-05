# encoding: utf-8

require "test_helper"
class RoleMovieFlowsTest < ActionDispatch::IntegrationTest
  setup do
    get "/auth/twitter/callback"
    @user = SocialProfile.find_by(uid: "123545").user
    @movie = movies(:one)
    @movie.director = directors(:one)
    @movie.country = countries(:one)
    @movie.save
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

    @user.save
  end

  def set_user
    @user.role = roles(:two)
    @user.role.abilities << abilities(:two)
    @user.role.abilities << abilities(:three)
    @user.save
  end

  test "movie by admin" do
    set_admin
    get movies_path
    assert_response :success

    get movie_path @movie
    assert_response :success

    get edit_movie_path @movie
    assert_response :success

    patch movie_path @movie, params: { movie: { title: "iaia_title" } }
    assert_redirected_to movie_path(@movie)
    @movie.reload
    assert_equal "iaia_title", @movie.title
  end

  test "movie by user" do
    set_user
    get movies_path
    assert_response :success

    get movie_path @movie
    assert_response :success

    assert_raise(Pundit::NotAuthorizedError) do
      get edit_movie_path @movie
    end

    orig_title = @movie.title

    assert_raise(Pundit::NotAuthorizedError) do
      patch movie_path @movie, params: { movie: { title: "iaia_title" } }
    end

    @movie.reload

    assert_equal orig_title, @movie.title
  end
end
