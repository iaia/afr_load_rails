class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def index?
    can?(__method__)
  end

  def show?
    can?(__method__) and mine?
  end

  def edit?
    can?(__method__) and mine?
  end

  def new?
    can?(__method__)
  end

  def create?
    can?(__method__)
  end

  def update?
    can?(__method__) and mine?
  end

  def destroy?
    can?(__method__) and not record.admin?
  end
end
