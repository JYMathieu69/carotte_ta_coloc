class ValidateTasksJob < ApplicationJob
  queue_as :default

  def perform(ongoing_task)
    ValidateTasksService.new(ongoing_task: ongoing_task).call
  end
end

