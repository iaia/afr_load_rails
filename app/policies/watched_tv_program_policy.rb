class WatchedTvProgramPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def index?
    mine?
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
    mine?
  end

  def update?
    mine?
  end
end
