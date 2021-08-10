class WeeklyDistributionJob < ApplicationJob
  queue_as :default

  def perform(coloc)
    DistributionTasksService.new(coloc: coloc).call
  end
end
