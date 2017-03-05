require 'test_helper'

class RecordedsControllerTest < ActionDispatch::IntegrationTest
    setup do
        @user = users(:one)
        @tv_program = tv_programs(:one)
        @recorded = recordeds(:one)
    end

    test "should get index" do
        get recordeds_url
        assert_response :success
    end

    test "should get new" do
        get new_recorded_url
        assert_response :success
    end

    test "should create recorded" do
        assert_difference('Recorded.count') do
            post recordeds_url, params: { recorded: {user_id: @user.id, tv_program_id: @tv_program.id} }
        end

        assert_redirected_to recorded_url(Recorded.last)
    end

    test "should show recorded" do
        get recorded_url(@recorded)
        assert_response :success
    end

    test "should get edit" do
        get edit_recorded_url(@recorded)
        assert_response :success
    end

    test "should update recorded" do
        patch recorded_url(@recorded), params: { recorded: {recorded: true} }
        assert_redirected_to recorded_url(@recorded)
    end

    test "should destroy recorded" do
        assert_difference('Recorded.count', -1) do
            delete recorded_url(@recorded)
        end

        assert_redirected_to recordeds_url
    end
end
