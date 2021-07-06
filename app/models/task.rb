class Task < ApplicationRecord
    has_many :coloc_tasks

    has_one_attached :image
end
