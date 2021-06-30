class CreateCarottedTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :carotted_tasks do |t|
      t.references :ongoing_task, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.references :carotted_user, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
