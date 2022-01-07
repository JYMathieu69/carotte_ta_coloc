namespace :coloc do
  desc "Tasks distribution"
  task weekly_distribution: :environment do
    colocs = Coloc.where(assignment_day: Time.now.strftime("%A"))
    colocs.each { |coloc| WeeklyDistributionJob.perform_later(coloc) }
  end

  # Rake Task non nécessaire pour le moment, unfinished task non pris en compte dans les taches quotidiennes. Elles ne sont plus assignées mais validées directement.

  # desc "Create unfinished taks"
  # task create_daily_unfinished_tasks: :environment do
  #   colocs = Coloc.all
  #   colocs.each { |coloc| CreateDailyUnfinishedTasksJob.perform_later(coloc) }
  # end
end
