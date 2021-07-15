class OngoingTask < ApplicationRecord
  belongs_to :coloc_task
  belongs_to :user, optional: true

  has_one_attached :photo_before
  has_one_attached :photo_after

  has_one :task, through: :coloc_task
  delegate :name, :description, :image, :auto_assigned, to: :task

  has_many :votes
  has_many :helpers
  has_many :carotted_tasks
  has_many :positive_votes, -> { where(validated: true) }, class_name: 'Vote'
  has_many :unfinished_tasks

  validates :points_ratio, presence: true
  validates :points_ratio, numericality: { only_float: true }
  validates :points_ratio, numericality: { greater_than_or_equal_to: 1 }
  validates :final_points, presence: true
  validates :final_points, numericality: { only_integer: true }
  validates :final_points, numericality: { greater_than_or_equal_to: 1 }
end
