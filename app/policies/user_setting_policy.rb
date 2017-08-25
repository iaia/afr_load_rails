class UserSettingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def application_editor_permission?
    mine?
  end

  def update?
    mine?
  end
end
