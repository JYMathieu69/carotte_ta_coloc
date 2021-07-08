class CreateUnfinishedTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :unfinished_tasks do |t|
      t.references :ongoing_task, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
