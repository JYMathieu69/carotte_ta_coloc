class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  belongs_to :coloc, optional: true

  has_many :ongoing_tasks
  has_many :carotted_tasks
  has_many :helpers
  has_many :votes

  has_one_attached :avatar

  before_create :set_default_avatar

  private

  def set_default_avatar
    self.avatar.attach(io: File.open('app/assets/images/default_avatar.png'), filename: 'default_avatar.png', content_type: 'image/png')
  end
end
