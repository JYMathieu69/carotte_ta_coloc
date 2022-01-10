class AddNumberOfPeopleToColocs < ActiveRecord::Migration[6.1]
  def change
    add_column :colocs, :number_of_people, :integer
  end
end
