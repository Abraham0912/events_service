class MembersController < ApplicationController
    before_action :authenticate_user!
  
    def show
      render json: { message: "welcome your info!" }
    end
end