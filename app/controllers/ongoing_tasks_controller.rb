class OngoingTasksController < ApplicationController
  before_action :set_ongoing_task, only: [:validate_task, :validation_update, :assign_task, :assign_task_update,  :update, :unassign_task]

  def index
    redirect_to '/home' and return if current_user.coloc.nil?

    all_ongoing_tasks = current_user.coloc.ongoing_tasks
    @user_tasks = all_ongoing_tasks.where(user: current_user)
    @colocs_tasks = all_ongoing_tasks.where.not(user: current_user).order(:user_id)
    @unassigned_tasks = all_ongoing_tasks.where(user: nil)
    all_users = current_user.coloc.users
    @users_coloc = all_users.filter { |user| user != current_user }
  end

  def show
    @ongoing_task = OngoingTask.find(params[:id])
  end

  def update
    @ongoing_task.helpers.destroy_all if @ongoing_task.helpers
    if @ongoing_task.update(ongoing_task_params)
      redirect_to ongoing_tasks_path
    else
      redirect_to :edit
    end
  end

  def validation_update
    @ongoing_task.helpers.destroy_all if @ongoing_task.helpers
    if @ongoing_task.update(ongoing_task_params)
      @ongoing_task.finished_at = DateTime.now
      @ongoing_task.save
      add_task_points_to_user_current_points(@ongoing_task.final_points)
      redirect_to ongoing_tasks_path
    else
      redirect_to validation_update(@ongoing_task)
    end
  end

  def validate_task
    potential_helpers = User.where(coloc_id: current_user.coloc.id).where.not(id: current_user.id)
    helpers_ids_array = helpers_that_where_already_selected
    potential_helpers.each do |potential_helper|
      unless helpers_ids_array.include? potential_helper.id
        @ongoing_task.helpers.build(user: potential_helper, ongoing_task_id: @ongoing_task.id )
      end
    end
  end

  def assign_task
  end

  def assign_task_update
    @ongoing_task.user = current_user
    if @ongoing_task.update(ongoing_task_params)
      redirect_to ongoing_tasks_path
    else
      render :assign_task
    end
  end

  def unassign_task
    @ongoing_task.user = nil
    @ongoing_task.photo_before = nil
    if @ongoing_task.save
      redirect_to ongoing_tasks_path
    else
      render :index
    end
  end

  def start_ongoing_tasks
    coloc = current_user.coloc
    StartUnassignedTasksJob.perform_now(coloc)
    coloc.assignment_day = Time.now.strftime('%A')
    WeeklyDistributionJob.perform_now(coloc)
    if coloc.save
      redirect_to ongoing_tasks_path
    else
      @error = 'Veuillez réessayer.' # A modifier...
    end
  end

  private

  def add_task_points_to_user_current_points(ongoing_task_final_points)
    current_user.current_points += ongoing_task_final_points
    current_user.save
  end

  def helpers_that_where_already_selected
    @ongoing_task.helpers.map do |helper|
      helper.user_id
    end 
  end

  def set_ongoing_task
    @ongoing_task = OngoingTask.find(params[:id])
  end

  def ongoing_task_params
    params.require(:ongoing_task).permit(:name, :photo_after, :photo_before, helpers_attributes: [ :ongoing_task_id, :user_id])
  end
end
