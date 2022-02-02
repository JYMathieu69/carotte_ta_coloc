class ColocTasksController < ApplicationController
  before_action :set_coloc_task, only: [:destroy]
  before_action :set_coloc, only: [:new, :create, :destroy]

  def new
    existing_tasks = @coloc.coloc_tasks.map { |coloc_task| coloc_task.task_id }
    @addable_tasks = Task.where.not(id: existing_tasks)
    @new_coloc_task = ColocTask.new
  end
  
  def create
    items = params[:items]

    items.values.each do |item|
      if item["task"] != "0"
        new_coloc_task = ColocTask.new()
        new_coloc_task.coloc = @coloc
        new_coloc_task.task = Task.find(item["task"])
        render :new if !new_coloc_task.save
      end
    end
    
    redirect_to edit_coloc_path(@coloc), notice: "La/les nouvelles tâches ont bien été ajoutées à la coloc !"
  end
  
  def destroy
    @coloc_task.destroy

    redirect_to edit_coloc_path(@coloc)
  end

  private

  def set_coloc_task
    @coloc_task = ColocTask.find(params[:id])
  end

  def set_coloc
    @coloc = current_user.coloc
  end
end
