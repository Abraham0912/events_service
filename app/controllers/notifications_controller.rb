class NotificationsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_notification, only: [:show, :update, :destroy]

    def index
      @notifications = Notification.all
      authorize @notifications
  
      render json: @notifications.order(:id)
    end
  
    def show
      render json: @notification
    end
  
    def create
      @notification = Notification.new(notification_params)
      authorize @notification
      if @notification.save
        render json: @notification, status: :created, location: @notification
      else
        render json: @notification.errors, status: :unprocessable_entity
      end
    end

    def update
      authorize @notification
      if @notification.update(notification_params)
        render json: @notification
      else
        render json: @notification.errors, status: :unprocessable_entity
      end
    end
  
    def destroy
      authorize @notification
      if @notification.destroy
        render json:{message:"Registro borrado exitosamente !!"}
      else
        render json: @notification.errors, status: :unprocessable_entity
      end
    end
  
    private
      def set_notification
        @notification = Notification.find(params[:id])
        authorize @notification
      end
  
      def notification_params
        params.require(:notification).permit(:name, :capacity, :location)
      end
end
