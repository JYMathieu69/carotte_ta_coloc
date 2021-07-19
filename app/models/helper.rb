class Helper < ApplicationRecord
  belongs_to :user
  belongs_to :ongoing_task

  validate :ongoing_task_is_assigned?, :helper_is_not_ongoing_task_user?

  validates :user, uniqueness: { scope: :ongoing_task, message: "you can only help once for a task!" }

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
