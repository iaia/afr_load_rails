require 'test_helper'

class TvProgramFlowsTest < ActionDispatch::IntegrationTest
    def setup
        @tv_program = tv_programs(:one)
    end

    test "should get index" do
        get tv_programs_path
        assert_response :success
    end

end
