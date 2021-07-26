class ChangeDoneInOngoingTask < ActiveRecord::Migration[6.1]
  def change
    change_column :ongoing_tasks, :done, :boolean, default: false
  end
end
