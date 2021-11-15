class PalacesController < ApplicationController
    before_action :authenticate_user!
    before_action :set_palace, only: [:show, :update, :destroy]

    def index
      @palace = Palace.all
      authorize @palace
  
      render json: @palace.order(:id)
    end
  
    def show
      render json: @palace
    end
  
    def create
      @palace = Palace.new(palace_params)
      authorize @palace
      if @palace.save
        render json: @palace, status: :created, location: @palace
      else
        render json: @palace.errors, status: :unprocessable_entity
      end
    end

    def update
      authorize @palace
      if @palace.update(palace_params)
        render json: @palace
      else
        render json: @palace.errors, status: :unprocessable_entity
      end
    end
  
    def destroy
      authorize @palace
      if @palace.destroy
        render json:{message:"Registro borrado exitosamente !!"}
      else
        render json: @palace.errors, status: :unprocessable_entity
      end
    end
  
    private
      def set_palace
        @palace = Palace.find(params[:id])
        authorize @palace
      end
  
      def palace_params
        params.require(:palace).permit(:name, :capacity, :location)
      end
end
