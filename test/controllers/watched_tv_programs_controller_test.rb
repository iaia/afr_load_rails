require 'test_helper'

class WatchedTvProgramsControllerTest < ActionDispatch::IntegrationTest
    setup do
        @user = users(:one)
        @tv_program = tv_programs(:one)
        @tv_program.movie = movies(:one)
        @watched_tv_program = watched_tv_programs(:one)
    end

    test "should get index" do
        get watched_tv_programs_url
        assert_response :success
    end

    test "should get new" do
        get new_watched_tv_program_url
        assert_response :success
    end

    test "should create watched_tv_program" do
        assert_difference('WatchedTvProgram.count') do
            post watched_tv_programs_url, params: { watched_tv_program: {user_id: @user.id, tv_program_id: @tv_program.id, watched_time: DateTime.now} }
        end

        assert_redirected_to watched_tv_program_url(WatchedTvProgram.last)
    end

    test "should show watched_tv_program" do
        get watched_tv_program_url(@watched_tv_program)
        assert_response :success
    end

    test "should get edit" do
        get edit_watched_tv_program_url(@watched_tv_program)
        assert_response :success
    end

    test "should update watched_tv_program" do
        @tv_program.movie.save
        @watched_tv_program.tv_program = @tv_program
        @watched_tv_program.tv_program.save
        @watched_tv_program.save

        patch watched_tv_program_url(@watched_tv_program), params: { watched_tv_program: {watched: true, watched_date: DateTime.now  } }
        assert_redirected_to watched_tv_program_url(@watched_tv_program)
    end

    test "should destroy watched_tv_program" do
        assert_difference('WatchedTvProgram.count', -1) do
            delete watched_tv_program_url(@watched_tv_program)
        end

        assert_redirected_to watched_tv_programs_url
    end
end
