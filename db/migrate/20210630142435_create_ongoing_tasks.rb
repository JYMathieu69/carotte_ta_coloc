class CreateOngoingTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :ongoing_tasks do |t|
      t.boolean :done
      t.datetime :finished_at
      t.float :points_ratio
      t.integer :final_points
      t.references :coloc_task, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
