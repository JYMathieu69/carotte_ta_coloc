class AddColocrefToUsers < ActiveRecord::Migration[6.1]
  def change
    add_reference :users, :coloc, null: true, foreign_key: true
  end
end
