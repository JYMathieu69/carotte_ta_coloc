class OngoingTask < ApplicationRecord
  belongs_to :coloc_task
  belongs_to :user

  has_one_attached :photo_before
  has_one_attached :photo_after

  has_one :task, through: :coloc_task
  delegate :name, :description, :image, to: :task

  has_many :votes
  has_many :helpers
  has_many :carotted_tasks
  has_many :positive_votes, -> { where(validated: true) }, class_name: 'Vote'

end
