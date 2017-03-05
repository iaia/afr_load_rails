require 'test_helper'

class RecordedTest < ActiveSupport::TestCase
    def setup
        @user = users(:one)
        @tv = tv_programs(:one)
    end

    test "recorded tv" do
        recorded = @user.recordeds.build(tv_program_id: @tv.id, recorded: true)
        assert_equal(@tv.id, recorded.user.id)
        assert(recorded.valid?)
        assert(recorded.recorded)
    end

    test "recorded movie duplicate" do
        recorded = @user.recordeds.build(tv_program_id: @tv.id, recorded: true)
        recorded.save
        assert_equal(@tv.id, recorded.user.id)
        assert(recorded.valid?)
        assert(recorded.recorded)

        recorded2 = @user.recordeds.build(tv_program_id: @tv.id, recorded: true)
        recorded2.save

        assert(recorded2.invalid?)
    end
end
