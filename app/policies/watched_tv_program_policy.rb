class WatchedTvProgramPolicy < ApplicationPolicy
    class Scope < Scope
        def resolve
            scope
        end
    end

    def initialize(user, watched_tv)
        @user = user
        @watched_tv = watched_tv
    end

    def index?
        myself?
    end

    def new?
        true
    end

    def show?
        true
    end

    def edit?
        true
    end

    def destroy?
        true
    end

    def create?
        myself?
    end

    def update?
        myself?
    end

    private
    def myself?
        return false if user == nil
        if @watched_tv.respond_to?(:where)
            return false if @watched_tv.where.not(user_id: user.id).count > 0
            true
        else
            @watched_tv.user_id == user.id
        end
    end

end
