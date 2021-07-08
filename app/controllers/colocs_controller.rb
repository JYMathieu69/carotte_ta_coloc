class ColocsController < ApplicationController

    def new
      @coloc = Coloc.new
    end 

    def create
      @coloc = Coloc.new(coloc_params)
      @coloc.leader = current_user
      if @coloc.save
        redirect_to coloc_path(@coloc)
      else
        render :new
      end
    end

    def show
        @coloc = Coloc.includes(:ongoing_tasks).find(params[:id])
    end

    private

    def coloc_params
      params.require(:coloc).permit(:name)
    end
  
end
