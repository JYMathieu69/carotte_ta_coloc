class ColocsController < ApplicationController

  before_action :set_coloc, only: [:edit, :update, :recap, :invitation]

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
    @tasks.each do |task|
      @coloc.coloc_tasks.build(task: task, difficulty: task.default_difficulty)
    end
 end

 def recap
 end

 def invitation
 end

 def update
   if @coloc.update(coloc_params)
      redirect_to "/colocs/#{@coloc.id}/recap"
   else
      render :edit
   end
 end

 private 

 def coloc_params
    params.require(:coloc).permit(:name, coloc_tasks_attributes: [:task_id, :difficulty, :coloc_task_ids])
 end

 def set_coloc
    @coloc = Coloc.find(params[:id])
 end

end
