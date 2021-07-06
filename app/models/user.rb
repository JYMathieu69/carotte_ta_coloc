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
end
