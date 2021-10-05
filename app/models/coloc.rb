class Coloc < ApplicationRecord
  belongs_to :leader, class_name: "User"
  
  has_many :users
  has_many :coloc_tasks
  accepts_nested_attributes_for :coloc_tasks, reject_if: lambda {|attributes| attributes['task_id'].eql? "0"}

  has_many :ongoing_tasks, through: :coloc_tasks
  
  validates :name, presence: true
  validates :name, uniqueness: true

  validates :name, format: { with: /\A[a-zA-Z0-9\s]+\z/,
  message: "only letters and digits" }

  validates :name, length: { in: 2..20 }

  validates :leader, uniqueness: true
  validates :leader, presence: true

  after_create :set_invite_token

  private

  def set_invite_token
    self.update_column(:invite_token, "#{id}-#{SecureRandom.hex(4)}")
  end
end
