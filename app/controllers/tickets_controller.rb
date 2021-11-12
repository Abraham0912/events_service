class TicketsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_ticket, only: [:show, :update, :destroy]

    def index
        @tickets = Ticket.all
        authorize @tickets
        render json: @tickets
    end

    def show
        render json: @ticket
    end
    
    def create
        @ticket = Ticket.new(ticket_params)
        authorize @ticket
        if(@ticket.save)
            render json: @ticket, status: :created
        else
            render json: @ticket.errors, status: :unprocessable_entity
        end
    end

    def update
        authorize @ticket
        if @ticket.update(ticket_params)
          render json: @ticket
        else
          render json: @ticket.errors, status: :unprocessable_entity
        end
    end

    def destroy
      authorize @ticket
      if @ticket.destroy
        render json:{message:"Registro eliminado exitosamente !!"}
      else
        render json: @ticket.errors, status: :unprocessable_entity
      end
    end

    private

    def set_ticket
        @ticket = Ticket.find(params[:id])
        authorize @ticket
    end

    def ticket_params
        params.require(:ticket).permit(:description,:event_id,:user_id)
    end
end