class CarottedTask < ApplicationRecord
  belongs_to :ongoing_task
  belongs_to :user
  belongs_to :carotted_user, class_name: "User"

  has_one :coloc_task, through: :ongoing_task
  has_one :task, through: :coloc_task

  delegate :name, to: :task

  validate :carotted_user_different_from_user

  def self.carroted_price(ongoing_task_price)
    ongoing_task_price + 10
  end

  private

  def carotted_user_different_from_user
    errors.add(:carotted_user, "can't be the same as user") if carotted_user == user
  end
end
