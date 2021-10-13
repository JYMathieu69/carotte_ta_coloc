require 'rails_helper'

RSpec.describe ValidateTasksJob, type: :job do
  describe 'is performed later' do
    it 'validates a task' do
      ongoing_task = create(:ongoing_task)
      ActiveJob::Base.queue_adapter = :test
      expect { ValidateTasksJob.perform_later(ongoing_task) }.to have_enqueued_job
    end
    it 'is performed after 4 hours on default queue' do
      ActiveJob::Base.queue_adapter = :test
      ongoing_task = create(:ongoing_task)
      expect { ValidateTasksJob.set(wait: 4.hours, queue: 'default').perform_later(ongoing_task) }
        .to have_enqueued_job.with(ongoing_task).on_queue('default')
    end
  end
end

