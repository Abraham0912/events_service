class UsersController < ApplicationController
    def index
        @users = User.all
        # @users = 'Hola abraham'
    
        render json: @users
      end
end