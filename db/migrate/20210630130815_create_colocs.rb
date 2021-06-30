class CreateColocs < ActiveRecord::Migration[6.1]
  def change
    create_table :colocs do |t|
      t.string :name
      t.string :invite_token
      t.references :leader, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
