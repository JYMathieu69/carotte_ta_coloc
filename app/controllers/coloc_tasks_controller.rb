class ColocTasksController < ApplicationController
  before_action :set_coloc_task, only: [:destroy]

  def create
    items = params[:items]

    items.values.each do |item|
      if item["task"] != "0"
        new_coloc_task = ColocTask.new()
        new_coloc_task.coloc = current_user.coloc
        new_coloc_task.task = Task.find(item["task"])
        render 'colocs/edit' if !new_coloc_task.save
      end
    end
    
    redirect_to edit_coloc_path(current_user.coloc)
  end
  
  def destroy
    coloc = @coloc_task.coloc
    @coloc_task.destroy

    redirect_to edit_coloc_path(coloc)
  end

  private

  def set_coloc_task
    @coloc_task = ColocTask.find(params[:id])
  end
end
