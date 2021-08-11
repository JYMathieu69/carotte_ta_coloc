class StartUnassignedTasksJob < ApplicationJob
  queue_as :default

  def perform(coloc)
    StartUnassignedTasksService.new(coloc: coloc).call
  end
end
