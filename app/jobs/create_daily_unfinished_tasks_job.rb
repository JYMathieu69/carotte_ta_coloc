class CreateDailyUnfinishedTasksJob < ApplicationJob
  queue_as :default

  def perform(coloc)
    DailyUnfinishedTasksService.new(coloc: coloc).call
  end
end
