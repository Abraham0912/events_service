class PalacesController < ApplicationController
    # before_action :authenticate_user!
    before_action :set_palace, only: [:show, :update, :destroy]

    def index
      @palace = Palace.all
      authorize @palace
  
      render json: @palace
    end
  
    # GET /articles/1
    def show
      render json: @palace
    end
  
    # POST /articles
    def create
      @palace = Palace.new(palace_params)
      authorize @palace
      if @palace.save
        render json: @palace, status: :created, location: @palace
      else
        render json: @palace.errors, status: :unprocessable_entity
      end
    end
  
    # PATCH/PUT /articles/1
    def update
      authorize @palace
      if @palace.update(palace_params)
        render json: @palace
      else
        render json: @palace.errors, status: :unprocessable_entity
      end
    end
  
    # DELETE /articles/1
    def destroy
      authorize @palace
      if @palace.destroy
        render json:{message:"Se borro chido !!"}
      else
        render json: @palace.errors, status: :unprocessable_entity
      end
    end
  
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_palace
        @palace = Palace.find(params[:id])
        authorize @palace
      end
  
      # Only allow a list of trusted parameters through.
      def palace_params
        params.require(:palace).permit(:name, :capacity, :location)
      end
end