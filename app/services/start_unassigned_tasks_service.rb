class StartUnassignedTasksService
  def initialize(attributes = {})
    @coloc = attributes[:coloc]
    @unassigned_coloc_tasks = get_unassigned_coloc_tasks
  end

  def call
    @unassigned_coloc_tasks.each do |unassigned_coloc_task|
      OngoingTask.create!(coloc_task_id: unassigned_coloc_task.id)
    end
  end

  private

  def get_unassigned_coloc_tasks
    @coloc.coloc_tasks.filter { |coloc_task| coloc_task.auto_assigned == false }
  end
end
