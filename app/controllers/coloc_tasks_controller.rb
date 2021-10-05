class ColocTasksController < ApplicationController
  before_action :set_coloc_task

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
