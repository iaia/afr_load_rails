require "test_helper"

class RecordedsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @recorded = recordeds(:one)
    @recorded.recorded = false
    @recorded.tv_program = tv_programs(:one)

    get "/auth/twitter/callback"
    @user = SocialProfile.find_by(uid: "123545").user
    @user.recordeds << @recorded
    @user.save

    @tv_program = tv_programs(:two)
  end

  def set_another_user
    @another_user = users(:one)
    @user.recordeds << @recorded
    @user.save
  end

  test "should get index" do
    get recordeds_url
    assert_response :success
  end

  test "should create recorded" do
    assert_difference("Recorded.count") do
      post recordeds_url,
           params:
           {
             recorded:
             {
               user_id: @user.id,
               tv_program_id: @tv_program.id
             }
           }
    end

    assert_redirected_to recorded_url(Recorded.last)
  end

  test "should update recorded" do
    patch recorded_url(@recorded),
          params:
          {
            recorded:
            {
              recorded: true
            }
          }
    assert_redirected_to recorded_url(@recorded)
  end

  test "should destroy recorded" do
    assert_difference("Recorded.count", -1) do
      delete recorded_url(@recorded)
    end

    assert_redirected_to recordeds_url
  end

  test "should create recorded by another user" do
    set_another_user
    assert_raise(Pundit::NotAuthorizedError) do
      post recordeds_url,
           params:
           {
             recorded:
             {
               user_id: @another_user.id,
               tv_program_id: @tv_program.id
             }
           }
    end
  end
end
