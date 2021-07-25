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

  before_create :set_invite_token

  def full_invite_token
    "#{self.id}-#{self.invite_token}"
  end

  private

  def set_invite_token
    self.invite_token = SecureRandom.hex
  end
end
