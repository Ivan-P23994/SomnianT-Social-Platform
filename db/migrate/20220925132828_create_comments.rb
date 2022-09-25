class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.string :body
      t.references :author, index: true, foreign_key: { to_table: :users }, null: false
      t.references :post, index: true, foreign_key: { to_table: :posts }, null: false

      t.timestamps
    end
  end
end
