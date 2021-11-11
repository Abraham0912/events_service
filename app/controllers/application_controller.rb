class ApplicationController < ActionController::API
    include Pundit

    rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
    private
    def user_not_authorized
        render json: {message:'No tiene suficientes permisos'}
    end
end
