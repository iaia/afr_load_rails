require 'test_helper'

class DirectorFlowsTest < ActionDispatch::IntegrationTest
    def setup
        @director = directors(:one)
    end

    test "should get index" do
        get directors_path
        assert_response :success
    end

    test "should get show" do
        get director_path @director
        assert_response :success
    end

    test "should get edit" do
        get edit_director_path @director.id
        assert_response :success
    end

    test "should post update" do
        new_name = "ケビン・ドノバン"
        new_name_ja = " kevin donovan"
        patch director_path @director, params: {director: {name: new_name, name_ja: new_name_ja}}
        assert_redirected_to director_path @director
        @director.reload
        assert_equal new_name, @director.name
        assert_equal new_name_ja, @director.name_ja
    end

end
