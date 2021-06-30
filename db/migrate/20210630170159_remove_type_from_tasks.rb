class RemoveTypeFromTasks < ActiveRecord::Migration[6.1]
  def change
    remove_column :tasks, :type, :string
  end
end
