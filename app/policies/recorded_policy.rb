class RecordedPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def index?
    mine?
  end

  def show?
    true
  end

  def edit?
    mine?
  end

  def create?
    mine?
  end

  def update?
    mine?
  end

  def destroy?
    mine?
  end
end
