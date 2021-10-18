class CarottedTasksController < ApplicationController
  before_action :set_ongoing_task, only: [:create]

  def create
    return unless user_own_ongoing_task
    return if cannot_carrot_done_task

    @enough_carrots = user_has_enough_points
    if @enough_carrots
      carrot_a_random_user
      redirect_to carotted_task_path(@carroted_task)
    else
      @message = "Désolé tu n'as pas assez de carrotes!"
      render :not_enough_carrots
    end
  end

  def show
    @carroted_task = CarottedTask.includes(:carotted_user).find(params[:id])
  end

  private

  def set_ongoing_task
    @ongoing_task = OngoingTask.find(params[:ongoing_task_id])
  end

  def cannot_carrot_done_task
    if @ongoing_task.done || @ongoing_task.finished?
      @message = 'Tu ne peux pas carroter une tâche déjà effectuée!'
      render :not_enough_carrots
      true
    else
      false
    end
  end

  def carrot_a_random_user
    carotted_user = pick_carroted_user
    @carroted_task = CarottedTask.create(ongoing_task: @ongoing_task, carotted_user: carotted_user, user: current_user)
    @ongoing_task.user = carotted_user
    @ongoing_task.save
    substract_carrots
  end

  def user_own_ongoing_task
    current_user == @ongoing_task.user
  end

  def user_has_enough_points
    return false if current_user.current_points.nil?

    current_user.current_points >= @ongoing_task.final_points
  end

  def substract_carrots
    current_user.current_points = current_user.current_points - @ongoing_task.final_points
    current_user.save
  end

  def pick_carroted_user
    coloc = @ongoing_task.user.coloc
    colocs_expect_current_user = User.where(coloc_id: coloc.id).where.not(id: current_user.id)
    colocs_expect_current_user.sample
  end
end
