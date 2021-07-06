class ChangeUserRefInOngoingTasks < ActiveRecord::Migration[6.1]
  def change
    change_column_null :ongoing_tasks, :user_id, true
  end
end
