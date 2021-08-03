class OngoingTasksController < ApplicationController
  def index
    redirect_to '/home' and return if current_user.coloc.nil?

    all_ongoing_tasks = current_user.coloc.ongoing_tasks
    @user_tasks = all_ongoing_tasks.where(user: current_user)
    @colocs_tasks = all_ongoing_tasks.where.not(user: current_user).order(:user_id)
    @unassigned_tasks = all_ongoing_tasks.where(user: nil)

    @tasks = Task.all
  end

  def show
    @ongoing_task = OngoingTask.find(params[:id])
  end
end
