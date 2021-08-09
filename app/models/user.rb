class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable

  belongs_to :coloc, optional: true

  has_many :ongoing_tasks
  has_many :carotted_tasks
  has_many :unfinished_tasks
  has_many :helpers
  has_many :votes

  has_one_attached :avatar

  validates :username, presence: true
  validates :username, uniqueness: true
  validates :username, length: { in: 3..15 }
  validates :username, format: { with: /\A[a-zA-Z0-9\s]+\z/,
  message: "only letters and digits" }

  validates :email, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }

  before_create :set_default_avatar

  before_create :set_default_points

  private

  def set_default_avatar
    self.avatar.attach(io: File.open('app/assets/images/default_avatar.png'), filename: 'default_avatar.png', content_type: 'image/png')
  end
  
  def set_default_points
    self.current_points = 0
  end
end
