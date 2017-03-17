class WatchedMoviePolicy < ApplicationPolicy
    class Scope < Scope
        def resolve
            scope
        end
    end

    def initialize(user, watched_movie)
        @user = user
        @watched_movie = watched_movie
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
        if @watched_movie.respond_to?(:where)
            return false if @watched_movie.where.not(user_id: user.id).count > 0
            true
        else
            @watched_movie.user_id == user.id
        end
    end

end
