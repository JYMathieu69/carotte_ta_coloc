class Helper < ApplicationRecord
  belongs_to :user
  belongs_to :ongoing_task

  validate :ongoing_task_is_assigned?, :helper_is_not_ongoing_task_user?

  private

  def helper_is_not_ongoing_task_user?
    if self.user == self.ongoing_task&.user
      errors.add(:user, "can't be the ongoing task user")
    end
  end

  def ongoing_task_is_assigned?
    unless self.ongoing_task&.assigned?
      errors.add(:user, "task needs to be assigned")
    end
  end
end
