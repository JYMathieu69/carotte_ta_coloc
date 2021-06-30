class AddAutoAssignedToTasks < ActiveRecord::Migration[6.1]
  def change
    add_column :tasks, :auto_assigned, :boolean
  end
end
