class WikisController < ApplicationController
    before_action :authenticate_user!
    before_action :set_wiki, only: [:show, :update, :destroy]

    # GET /articles
    def index
      @wikis = Wiki.all
      authorize @wikis
  
      render json: @wikis
    end
  
    # GET /articles/1
    def show
      render json: @wiki
    end
  
    # POST /articles
    def create
      @wiki = Wiki.new(wiki_params)
      authorize @wiki
      if @wiki.save
        render json: @wiki, status: :created, location: @wiki
      else
        render json: @wiki.errors, status: :unprocessable_entity
      end
    end
  
    # PATCH/PUT /articles/1
    def update
      authorize @wiki
      if @wiki.update(wiki_params)
        render json: @wiki
      else
        render json: @wiki.errors, status: :unprocessable_entity
      end
    end
  
    # DELETE /articles/1
    def destroy
      authorize @wiki
      if @wiki.destroy
        render json:{message:"Se borro chido !!"}
      else
        render json: @wiki.errors, status: :unprocessable_entity
      end
    end
  
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_wiki
        @wiki = Wiki.find(params[:id])
        authorize @wiki
      end
  
      # Only allow a list of trusted parameters through.
      def wiki_params
        params.require(:wiki).permit(:description)
      end
end
