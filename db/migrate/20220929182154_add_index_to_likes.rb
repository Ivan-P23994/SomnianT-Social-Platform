class AddIndexToLikes < ActiveRecord::Migration[7.0]
  def up
    add_index :likes, [:user_id, :liked_on_id, :liked_on_type], unique: true
  end

  def down
    remove_index :likes, [:user_id, :liked_on_id, :liked_on_type], unique: true
  end
end
