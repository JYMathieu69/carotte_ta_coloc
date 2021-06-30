class CreateColocTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :coloc_tasks do |t|
      t.integer :difficulty
      t.integer :points
      t.references :coloc, null: false, foreign_key: true
      t.references :task, null: false, foreign_key: true

      t.timestamps
    end
  end
end
