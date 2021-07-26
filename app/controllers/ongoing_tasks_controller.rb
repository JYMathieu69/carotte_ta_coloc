class OngoingTasksController < ApplicationController
  def index
    all_ongoing_tasks = current_user.coloc.ongoing_tasks
    @user_tasks = all_ongoing_tasks.where(user: current_user)
    @colocs_tasks = all_ongoing_tasks.where.not(user: current_user).order(:user_id)
    @unassigned_tasks = all_ongoing_tasks.where(user: nil)
  end
end
