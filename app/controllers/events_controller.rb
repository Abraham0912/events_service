class EventsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_event, only: [:show, :update, :destroy]

    def index
      @event = Event.all
      authorize @event
  
      render json: @event
    end
  
    def show
      render json: @event
    end
  
    def create
      @event = Event.new(event_params)
      authorize @event
      if @event.save
        render json: @event, status: :created, location: @event
      else
        render json: @event.errors, status: :unprocessable_entity
      end
    end

    def update
      authorize @event
      if @event.update(event_params)
        render json: @event
      else
        render json: @event.errors, status: :unprocessable_entity
      end
    end
  
    def destroy
      authorize @event
      if @event.destroy
        render json:{message:"Se elimino exitosamente !!"}
      else
        render json: @event.errors, status: :unprocessable_entity
      end
    end
  
    private
      def set_event
        @event = Event.find(params[:id])
        authorize @event
      end
  
      def event_params
        params.require(:event).permit(:name, :type_event, :description, :cancel,:palace_id)
      end
end
