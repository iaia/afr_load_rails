class ApplicationPolicy
    attr_reader :user, :record

    def initialize(user, record)
        @user = user
        @record = record
    end

    def can?(action)
        return false if user.nil?
        action = action.to_s.chop
        user.abilities.exists?(domain: record.class.to_s.split("::").first.underscore, ability: action)
    end

    def index?
        false
    end

    def show?
        scope.where(:id => record.id).exists?
    end

    def create?
        false
    end

    def new?
        create?
    end

    def update?
        false
    end

    def edit?
        update?
    end

    def destroy?
        false
    end

    def scope
        Pundit.policy_scope!(user, record.class)
    end

    class Scope
        attr_reader :user, :scope

        def initialize(user, scope)
            @user = user
            @scope = scope
        end

        def resolve
            scope
        end
    end
end
