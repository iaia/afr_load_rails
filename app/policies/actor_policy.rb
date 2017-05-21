class ActorPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def index?
    true
  end

  def show?
    true
  end

  def new?
    can?(__method__)
  end

  def create?
    can?(__method__)
  end

  def edit?
    can?(__method__)
  end

  def update?
    can?(__method__)
  end

  def destroy?
    can?(__method__)
  end
end
