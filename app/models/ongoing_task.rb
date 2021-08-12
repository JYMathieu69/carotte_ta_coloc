class OngoingTask < ApplicationRecord
  before_validation :set_final_points
  
  belongs_to :coloc_task
  belongs_to :user, optional: true

  has_one_attached :photo_before
  has_one_attached :photo_after

  has_one :coloc, through: :coloc_task
  has_one :task, through: :coloc_task
  delegate :name, :description, :image, :auto_assigned, to: :task

  has_many :votes
  has_many :helpers
  has_many :carotted_tasks
  has_many :positive_votes, -> { where(validated: true) }, class_name: 'Vote'
  has_many :unfinished_tasks
  
  validates :done, inclusion: { in: [true, false] }
  validates :points_ratio, presence: true
  validates :points_ratio, numericality: { only_float: true }
  validates :points_ratio, numericality: { greater_than_or_equal_to: 0 }
  validates :final_points, presence: true
  validates :final_points, numericality: { only_integer: true }
  validates :final_points, numericality: { greater_than_or_equal_to: 1 }

  accepts_nested_attributes_for :helpers, reject_if: lambda {|attributes| attributes['user_id'].eql? "0"}

  def assigned?
    return self.user
  end

  private

  def set_final_points
    (self.final_points = (self.coloc_task.points * self.points_ratio).round) if coloc_task.present?
  end
end
