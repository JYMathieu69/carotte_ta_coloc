class Task < ApplicationRecord
    has_many :coloc_tasks

    has_one_attached :image

    RECURRENCE = %w(daily weekly)

    validates :name, presence: true
    validates :name, uniqueness: true

    validates :description, presence: true
    validates :description, uniqueness: true

    validates :recurrence, presence: true
    validates :recurrence, inclusion: { in: RECURRENCE }

    validates :auto_assigned, inclusion: { in: [true, false],
    message: "is not a boolean" }

    validates :default_difficulty, presence: true
    validates :default_difficulty, numericality: { only_integer: true }
    validates :default_difficulty, numericality: { greater_than_or_equal_to: 1 }
    validates :default_difficulty, numericality: { less_than_or_equal_to: 4 }
end
