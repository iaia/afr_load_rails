require "test_helper"

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
    assert_raise(Pundit::NotAuthorizedError) do
      get edit_director_path @director.id
    end
  end

  test "should post update" do
    new_name = @director.name + "aaaa"
    new_name_ja = @director.name_ja + "aaaa"
    assert_raise(Pundit::NotAuthorizedError) do
      patch director_path @director,
                          params:
                          {
                            director:
                            {
                              name: new_name,
                              name_ja: new_name_ja
                            }
                          }
    end
    @director.reload
    assert_not_equal new_name, @director.name
    assert_not_equal new_name_ja, @director.name_ja
  end
end
