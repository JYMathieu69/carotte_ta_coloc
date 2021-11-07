require 'rails_helper'

RSpec.describe StartUnassignedTasksJob, type: :job do
  describe 'is performed later' do
    it 'creates unassigned tasks' do
      ongoing_task = create(:ongoing_task)
      ActiveJob::Base.queue_adapter = :test
      expect { StartUnassignedTasksJob.perform_later(ongoing_task) }.to have_enqueued_job
    end
  end
end
