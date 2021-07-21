class ColocsController < ApplicationController

  before_action :set_coloc, only: [:edit, :update, :recap]

 def new
    @coloc = Coloc.new
 end

 def create
    @coloc = Coloc.new(coloc_params)
    @coloc.leader = current_user
    if @coloc.save!
      redirect_to edit_coloc_path(@coloc)
    else
      render :new
    end
 end

 def edit
    @tasks = Task.all
 end

 def recap
 end

 def update
    chosen_tasks_id = params["coloc"]["coloc_tasks"]
    chosen_tasks_id.each do |task_id|
      create_coloc_task(task_id, @coloc)
    end
    redirect_to "/colocs/#{@coloc.id}/recap"
 end

 private 

 def coloc_params
    params.require(:coloc).permit(:name, :coloc_tasks)
 end

 def create_coloc_task(task_id, coloc)
    task = Task.find(task_id)
    coloc_task = ColocTask.create(task: task, coloc: coloc, difficulty: task.default_difficulty)
 end

 def set_coloc
    @coloc = Coloc.find(params[:id])
 end

end
