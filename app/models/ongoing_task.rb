class OngoingTask < ApplicationRecord
  belongs_to :coloc_task
  belongs_to :user
end
