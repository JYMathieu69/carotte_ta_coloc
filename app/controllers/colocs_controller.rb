class ColocsController < ApplicationController
  before_action :set_coloc, only: [:edit, :update, :recap, :invitation, :choose_tasks]

  def new
    @coloc = Coloc.new
  end

  def create
    @coloc = Coloc.new(coloc_params)
    @coloc.leader = current_user
    current_user.coloc = @coloc

    if @coloc.save && current_user.save
      redirect_to choose_tasks_path(@coloc)
    else
      render :new
    end
  end

  def choose_tasks
    @tasks = Task.all
    @tasks.each do |task|
      @coloc.coloc_tasks.build(task: task, difficulty: task.default_difficulty)
    end
  end

  def edit; end

  def recap; end

  def join
    @user = current_user
  end

  def invitation; end

  def update
    if @coloc.update(coloc_params)
      redirect_to is_completed? ? root_path : recap_path(@coloc)
    else
      render is_completed? ? :edit : :choose_tasks
    end
  end

  private

  def coloc_params
    params.require(:coloc).permit(:name, coloc_tasks_attributes: [:task_id, :difficulty, :coloc_task_ids])
  end

  def set_coloc
    @coloc = Coloc.find(params[:id])
  end

  def is_completed?
    @coloc.assignment_day
  end
end
