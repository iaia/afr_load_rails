require 'test_helper'

class UserTest < ActiveSupport::TestCase
    test "create user" do
        user = User.create(name: "iaia")
        assert_equal("iaia", user.name)
    end
    test "bad create user duplicate" do
        user = User.create(name: "iaia2")
        assert user.invalid?
    end

    test "bad create user 日本語" do
        user = User.create(name: "いあいあ")
        assert user.invalid?
    end
end
