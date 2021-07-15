class Task < ApplicationRecord
    has_many :coloc_tasks

    has_one_attached :image

    validates :name, presence: true
    validates :name, uniqueness: true

    validates :description, presence: true
    validates :description, uniqueness: true

    validates :recurrence, presence: true
    validates :recurrence, inclusion: { in: %w(Journalière Hebdomadaire),
    message: "%{value} is not a valid recurrence" }

    validates :auto_assigned, presence: true
    validates :auto_assigned, inclusion: { in: %w(true false),
    message: "%{value} is not a boolean" }

end
