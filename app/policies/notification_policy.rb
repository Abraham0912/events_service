class NotificationPolicy < ApplicationPolicy
    
    def index?
        true
    end
    
    def show?
        true
    end
    
    def create?
        true
    end
    
    def update?
        true
        # user.role == 'admin'
    end
    
    def destroy?
        true
        # user.role == 'admin'
    end
end