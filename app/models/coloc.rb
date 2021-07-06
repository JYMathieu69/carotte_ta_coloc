class Coloc < ApplicationRecord
  belongs_to :leader, class_name: "User"
  
  has_many :users
  has_many :coloc_tasks
  has_many :ongoing_tasks, through: :coloc_tasks
end
