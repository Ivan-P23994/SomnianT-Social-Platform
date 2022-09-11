# frozen_string_literal: true

class AddUsernameToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :username, :string, null: false, default: ''
    change_column :users, :email, :string, null: false, index: { unique: true }
  end
end
