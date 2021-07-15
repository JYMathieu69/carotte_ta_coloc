class ColocTask < ApplicationRecord
  belongs_to :coloc
  belongs_to :task

  has_many :ongoing_tasks

  validates :difficulty, presence: true
  validates :difficulty, numericality: { only_integer: true}
  validates :difficulty, numericality: { less_than_or_equal_to: 4 }
  validates :difficulty, numericality: { greater_than_or_equal_to: 1 }
  validates :points, presence: true
  validates :points, numericality: { only_integer: true }
  validates :points, numericality: { greater_than_or_equal_to: 1 }
  validates :coloc, uniqueness: { scope: :task, message: "no duplicated tasks in a coloc" }
  
end
