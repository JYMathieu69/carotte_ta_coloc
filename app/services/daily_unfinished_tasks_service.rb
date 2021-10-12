class DailyUnfinishedTasksService
  def initialize(attributes = {})
    @coloc = attributes[:coloc]
    @daily_not_done_ongoing_tasks = daily_not_done_ongoing_tasks
  end

  def call
    @daily_not_done_ongoing_tasks.each do |unassigned_ongoing_task|
      UnfinishedTask.create(ongoing_task: unassigned_ongoing_task, user: unassigned_ongoing_task.user) if unassigned_ongoing_task.user
      unassigned_ongoing_task.user = nil
      unassigned_ongoing_task.save
    end
  end

  private

  def daily_not_done_ongoing_tasks
    @coloc.ongoing_tasks.daily_not_finished_unassigned_tasks
  end
end
