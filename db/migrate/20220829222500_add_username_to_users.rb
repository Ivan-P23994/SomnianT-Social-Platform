class AddUsernameToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :username, :string, null: false
    change_column :users, :email, :string, null: false, index: { unique: true }
  end
end
