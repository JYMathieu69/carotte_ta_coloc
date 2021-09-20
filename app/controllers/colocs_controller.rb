class ColocsController < ApplicationController
  before_action :set_coloc, only: [:edit, :update, :recap, :invitation, :choose_tasks, :remove_coloc_user]

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
    @coloc.coloc_tasks.destroy_all if @coloc.coloc_tasks
    tasks_ids_array = tasks_already_selected
    @tasks = Task.all
    @tasks.each do |task|
      unless tasks_ids_array.include? task.id
        @coloc.coloc_tasks.build(task: task, difficulty: task.default_difficulty)
      end
    end
  end

  def edit
    @users = @coloc.users
  end

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

  def remove_coloc_user
    user = User.find(params[:user_id])
    user.coloc = nil
    if user.save
      redirect_to edit_coloc_path(@coloc)
    else
      render :edit
    end
  end

  private

  def coloc_params
    params.require(:coloc).permit(:name, coloc_tasks_attributes: [:task_id, :difficulty, :id, :_destroy])
  end

  def set_coloc
    @coloc = Coloc.find(params[:id])
  end

  def is_completed?
    @coloc.assignment_day
  end

  def tasks_already_selected
    @coloc.coloc_tasks.map do |coloc_task|
      coloc_task.task.id
    end
  end
end
