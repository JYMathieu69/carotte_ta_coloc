class Vote < ApplicationRecord
  belongs_to :ongoing_task
  belongs_to :user
end
