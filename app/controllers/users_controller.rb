class UsersController < ApplicationController
    before_action :authenticate_user!
    before_action :set_user, only: [:show, :update, :destroy]
# @users = current_user
    def index
        @user = User.all
        authorize @user
        render json: @user
      end

    def show
      render json: @user
    end
  
    def create
      #RECORDAR QUE PARA CREEAR HAY QUE USAR DEVICE, ENTONCES LA RUTA SERIA PARA CREAR UNA CUENTA 
    end
  
    def update
      authorize @user
      if @user.update(user_params)
        render json: @user
      else
        render json: @user.errors, status: :unprocessable_entity
      end
    end
  
    def destroy
      authorize @user
      if @user.destroy
        render json:{message:"Se borro chido !!"}
      else
        render json: @user.errors, status: :unprocessable_entity
      end
    end
  
    private
      def set_user
        @user = User.find(params[:id])
        authorize @user
      end
  
      def user_params
        params.require(:user).permit(:role, :email)
      end
end