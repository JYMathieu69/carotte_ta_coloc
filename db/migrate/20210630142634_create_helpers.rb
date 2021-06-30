class CreateHelpers < ActiveRecord::Migration[6.1]
  def change
    create_table :helpers do |t|
      t.references :user, null: false, foreign_key: true
      t.references :ongoing_task, null: false, foreign_key: true

      t.timestamps
    end
  end
end
