class CarottedTasksController < ApplicationController
  before_action :set_ongoing_task, only: [:create]
  
  def create
    return unless user_has_enough_points 
    coloc = @ongoing_task.user.coloc
    carotted_user = pick_carroted_user
    CarottedTask.create!(ongoing_task:  @ongoing_task , carotted_user: carotted_user, user: current_user)
    @ongoing_task.user = carotted_user
    @ongoing_task.save!
  end

  private

  def set_ongoing_task
    @ongoing_task = OngoingTask.find(params[:ongoing_task_id])
  end

  def user_has_enough_points
    user.current_points > ongoing_task.final_points
  end

  def substract_carrots(ongoing_task, user)
    user.current_points = user.current_points - ongoing_task.final_points
    user.save
  end      

  def pick_carroted_user
    colocs_expect_current_user = User.where(coloc_id: coloc.id).where.not(id: current_user.id)
    colocs_expect_current_user.sample
  end
end
