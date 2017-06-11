class WatchedMoviePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def index?
    mine?
  end

  def new?
    mine?
  end

  def show?
    mine?
  end

  def edit?
    mine?
  end

  def destroy?
    mine?
  end

  def create?
    mine?
  end

  def update?
    mine?
  end
end
