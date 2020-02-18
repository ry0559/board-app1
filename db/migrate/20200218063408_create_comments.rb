class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.string :comment
      t.timestamps
      t.references :board, foreign_key: true
      t.references :user, foreign_key: true
    end
  end
end
