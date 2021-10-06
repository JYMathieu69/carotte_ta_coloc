class OngoingTask < ApplicationRecord
  before_validation :set_final_points
  
  belongs_to :coloc_task
  belongs_to :user, optional: true

  has_one_attached :photo_before
  has_one_attached :photo_after

  has_one :coloc, through: :coloc_task
  has_one :task, through: :coloc_task
  delegate :name, :description, :image, :auto_assigned, to: :task

  has_many :votes, dependent: :destroy
  has_many :helpers, dependent: :destroy
  has_many :carotted_tasks, dependent: :destroy
  has_many :positive_votes, -> { where(validated: true) }, class_name: 'Vote'
  has_many :unfinished_tasks, dependent: :destroy
  
  validates :done, inclusion: { in: [true, false] }
  validates :points_ratio, presence: true
  validates :points_ratio, numericality: { only_float: true }
  validates :points_ratio, numericality: { greater_than_or_equal_to: 0 }
  validates :final_points, presence: true
  validates :final_points, numericality: { only_integer: true }
  validates :final_points, numericality: { greater_than_or_equal_to: 1 }

  validates_each :photo_after, :photo_before do |record, attr, value|
    if value.content_type && %w[image/jpeg image/jpg image/gif image/png].exclude?(value.content_type)
      record.errors.add(attr, 'must be an image')
      raise
    end
  end

  accepts_nested_attributes_for :helpers, reject_if: lambda { |attributes| attributes['user_id'].eql? "0"}

  scope :unassigned_tasks, -> { joins(:task).where(task: { auto_assigned: false}) }
  scope :not_done, -> { where(done: false) }
  scope :done, -> { where(done: true) }


  def assigned?
    self.user
  end

  def finished?
    self.finished_at
  end

  def done?
    done
  end


  private

  def set_final_points
    (self.final_points = (self.coloc_task.points * self.points_ratio).round) if coloc_task.present?
  end
end
