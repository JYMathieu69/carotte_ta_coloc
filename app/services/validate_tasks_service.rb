class ValidateTasksService
  def initialize(attributes = {})
    @ongoing_task = attributes[:ongoing_task]
  end

  def call
    OngoingTask.create(coloc_task_id: @ongoing_task.coloc_task.id)
    @ongoing_task.done = true
  end
end
