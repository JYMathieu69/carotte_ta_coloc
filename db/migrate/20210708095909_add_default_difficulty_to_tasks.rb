class AddDefaultDifficultyToTasks < ActiveRecord::Migration[6.1]
  def change
    add_column :tasks, :default_difficulty, :integer
  end
end
