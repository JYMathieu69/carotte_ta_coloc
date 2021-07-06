class ColocTask < ApplicationRecord
  belongs_to :coloc
  belongs_to :task

  has_many :ongoing_tasks
end
