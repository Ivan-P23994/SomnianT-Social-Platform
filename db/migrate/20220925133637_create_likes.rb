class CreateLikes < ActiveRecord::Migration[7.0]
  def change
    create_table :likes do |t|
      t.references :user, index: true, foreign_key: { to_table: :users }, null: false
      t.references :liked_on, polymorphic: true
      t.timestamps
    end
  end
end
