class ChangePointsRatioInOngoingTask < ActiveRecord::Migration[6.1]
  def change
    change_column :ongoing_tasks, :points_ratio, :float, default: 1.0
  end
end
