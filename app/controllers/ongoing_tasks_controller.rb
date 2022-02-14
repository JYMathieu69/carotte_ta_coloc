class OngoingTasksController < ApplicationController
  before_action :set_ongoing_task, only: [:validate_task, :validation_update, :update, :show]

  def index
    redirect_to '/home' and return if current_user.coloc.nil?
    redirect_to choose_tasks_path(current_user.coloc) and return if current_user.coloc.coloc_tasks.empty? && current_user == current_user.coloc.leader 

    all_ongoing_tasks = current_user.coloc.ongoing_tasks
    @user_tasks = current_user.current_week_ongoing_tasks
    task_by_name = all_ongoing_tasks.unassigned_tasks.group_by{ |ongoing_task| ongoing_task.name }
    @unassigned_tasks = task_by_name.map { |task_name, task| task.sort_by { |ongoing_task| ongoing_task.created_at }.last }
    all_users = current_user.coloc.users
    @users_coloc = all_users.filter { |user| user != current_user }
  end

  def show; end

  def update
    @ongoing_task.helpers.destroy_all if @ongoing_task.helpers

    redirect_to @ongoing_task.update(ongoing_task_params) ? ongoing_tasks_path : :edit
  end

  def validation_update
    return if cannot_validate_done_task
    photo = ongoing_task_params[:photo_after]
    if photo && file_is_too_large(photo.size)
      redirect_to validate_task_path(@ongoing_task), alert: "La taille de l'image ne peut pas dépasser 5Mb." and return
    end

    @ongoing_task.helpers.destroy_all if @ongoing_task.helpers
    @ongoing_task.user = current_user if !@ongoing_task.user
    @ongoing_task.validating = true
    if @ongoing_task.update(ongoing_task_params)
      @ongoing_task.finished_at = DateTime.now
      @ongoing_task.done = true
      @ongoing_task.save

      ValidateTasksJob.set(wait: 4.hours).perform_later(@ongoing_task) if @ongoing_task.task.recurrence == "daily" 
      add_task_points_to_colocs_points(@ongoing_task)
      redirect_to ongoing_tasks_path
    else
      build_helpers
      render :validate_task
    end
  end

  def validate_task
    build_helpers
  end

  def start_ongoing_tasks
    coloc = current_user.coloc
    if coloc.users.count != coloc.number_of_people
      redirect_to ongoing_tasks_path, alert: "Tout le monde n'est pas encore arrivé, tu ne peux pas lancer la distribution des tâches maintenant !" and return
    end

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
  
  def set_ongoing_task
    @ongoing_task = OngoingTask.find(params[:id])
  end

  def ongoing_task_params
    params.require(:ongoing_task).permit(:name, :photo_after, :photo_before, helpers_attributes: [ :ongoing_task_id, :user_id])
  end

  def build_helpers
    potential_helpers = User.where(coloc_id: current_user.coloc.id).where.not(id: current_user.id)
    helpers_ids_array = helpers_that_where_already_selected
    potential_helpers.each do |potential_helper|
      unless helpers_ids_array.include? potential_helper.id
        @ongoing_task.helpers.build(user: potential_helper, ongoing_task_id: @ongoing_task.id)
      end
    end
  end

  def cannot_validate_done_task
    if @ongoing_task.done || @ongoing_task.finished?
      @message = 'Tu ne peux pas valider une tâche déjà effectuée!'
      render :already_done
      true
    else
      false
    end
  end

  def add_task_points_to_colocs_points(ongoing_task)
    helpers = ongoing_task.helpers
    if helpers.empty?
       current_user.current_points += ongoing_task.final_points
    else
      participants = ongoing_task.helpers.count + 1
      points_to_add = (ongoing_task.final_points / participants).round
      current_user.current_points += points_to_add
      helpers.each do |helper|
       helper.user.current_points += points_to_add
       helper.user.save
      end
    end
      current_user.save
  end

  def helpers_that_where_already_selected
    
    @ongoing_task.helpers.map do |helper|
      helper.user_id
    end
  end

  def file_is_too_large(file_size)
    file_size > 5000000 # 5Mb max
  end
end
