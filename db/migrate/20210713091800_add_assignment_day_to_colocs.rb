class AddAssignmentDayToColocs < ActiveRecord::Migration[6.1]
  def change
    add_column :colocs, :assignment_day, :string
  end
end
