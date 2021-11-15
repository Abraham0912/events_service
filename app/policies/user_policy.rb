class UserPolicy < ApplicationPolicy
    
    def index?
        true
    end
    
    def show?
        true
    end
    
    def create?
        user.role == 'admin' || user.role == 'organizer'
    end
    
    def update?
        user.role == 'admin'
    end
    
    def destroy?
        user.role == 'admin'
    end

    class Scope < Scope
        def resolve
          if user.admin?
            scope.all
          else
            scope.where(role: :standard)
          end
        end
    end
end