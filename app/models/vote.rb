class Vote < ApplicationRecord
  belongs_to :ongoing_task
  belongs_to :user

  validates :validated, inclusion: { in: [true, false],
    message: "is not a boolean" }
end
