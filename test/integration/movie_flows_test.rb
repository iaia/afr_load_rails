require 'test_helper'

class MovieFlowsTest < ActionDispatch::IntegrationTest
    def setup
        @movie = movies(:one)
        @movie.director = directors(:one)
        @movie.country = countries(:one)
        @movie.save
    end

    test "should get index" do
        get movies_path
        assert_response :success
    end

    test "should get show" do
        get movie_path @movie
        assert_response :success
    end

    test "should get edit" do
        get edit_movie_path @movie
        assert_response :success
    end

    test "should post update" do
        new_title = "THE TUXEDO"
        new_title_ja = "タキシード"
        patch movie_path @movie, params: {movie: {title: new_title, title_ja: new_title_ja}}
        assert_redirected_to movie_path @movie
        @movie.reload
        assert_equal new_title, @movie.title
        assert_equal new_title_ja, @movie.title_ja
    end
end
