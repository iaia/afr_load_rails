class MoviePolicy < ApplicationPolicy
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

    def edit?
        can?(__method__)
    end

    def update?
        can?(__method__)
    end
end
