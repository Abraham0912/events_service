class EventPolicy < ApplicationPolicy
    
    def index?
        true
    end
    
    def show?
        true
    end
    
    def create?
        user.role == 'organizer'
    end
    
    def update?
        user.role == 'organizer' || user.role == 'admin'
    end
    
    def destroy?
        user.role == 'admin'
    end
end