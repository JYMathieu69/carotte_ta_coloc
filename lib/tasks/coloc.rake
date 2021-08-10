namespace :coloc do
  desc "Weekly tasks distribution"
  task weekly_distribution: :environment do
    colocs = Coloc.where(assignment_day: Time.now.strftime("%A"))
    colocs.each { |coloc| WeeklyDistributionJob.perform_later(coloc) }
  end
end
