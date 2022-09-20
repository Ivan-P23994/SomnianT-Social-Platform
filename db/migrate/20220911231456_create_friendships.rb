class CreateFriendships < ActiveRecord::Migration[7.0]
  def change
    create_table :friendships do |t|
      t.integer :user_id
      t.integer :friend_id
      t.timestamps null: false
    end
    add_index :friendships, [:user_id, :friend_id], unique: true
  end
end
