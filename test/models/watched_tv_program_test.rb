require 'test_helper'

class WatchedTvTest < ActiveSupport::TestCase
    def setup
        @user = users(:one)
        @tv = tv_programs(:one)
    end

    test "unwatched tv" do
        watched = @user.watched_tv_programs.build(tv_program_id: @tv.id, watched: false)
        assert_equal(@tv.id, watched.user.id)
        assert(watched.valid?)
        assert_not(watched.watched)
    end

    test "watched tv" do
        watched = @user.watched_tv_programs.build(tv_program_id: @tv.id, watched: true, watched_date: DateTime.now)
        assert_equal(@tv.id, watched.user.id)
        assert(watched.valid?)
        assert(watched.watched)
    end

    test "watched movie duplicate" do
        watched = @user.watched_tv_programs.build(tv_program_id: @tv.id, watched: true, watched_date: DateTime.now)
        watched.save
        assert_equal(@tv.id, watched.user.id)
        assert(watched.valid?)
        assert(watched.watched)

        watched2 = @user.watched_tv_programs.build(tv_program_id: @tv.id, watched: true, watched_date: DateTime.now)
        watched2.save

        assert(watched2.invalid?)
    end

end
