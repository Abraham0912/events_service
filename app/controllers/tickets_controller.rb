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
        if Event.find(params['event_id']).tickets.size < Event.find(params['event_id']).palace.capacity.to_i
          if(params['cost'] == 0)
            if(@ticket.save)
              render json: @ticket, status: :created
            else
                render json: @ticket.errors, status: :unprocessable_entity
            end
          else
            render json: {Error: "El costo del ticket no puede ser diferente de cero"}
          end
        else
          render json: {Error: "El cupo máximo para el evento es #{Event.find(params['event_id']).palace.capacity}"}
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