# https://relishapp.com/rspec/rspec-rails/docs/matchers/have-performed-job-matcher
require 'rails_helper'

RSpec.describe WeeklyDistributionJob do
  it 'runs on default queue' do
    ActiveJob::Base.queue_adapter = :test
    ActiveJob::Base.queue_adapter.perform_enqueued_jobs = true
    coloc = create(:coloc)
    expect { WeeklyDistributionJob.perform_later(coloc) }.to have_performed_job.on_queue('default')
  end
  it 'to act on a coloc' do
    ActiveJob::Base.queue_adapter = :test
    ActiveJob::Base.queue_adapter.perform_enqueued_jobs = true
    coloc = create(:coloc)
    expect { WeeklyDistributionJob.perform_later(coloc) }.to have_performed_job.with(coloc)
  end
end
