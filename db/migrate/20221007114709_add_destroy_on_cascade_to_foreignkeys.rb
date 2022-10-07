class AddDestroyOnCascadeToForeignkeys < ActiveRecord::Migration[7.0]
  def up
    remove_foreign_key 'comments', 'posts'
    add_foreign_key :comments, :posts, on_delete: :cascade
  end

  def down
    remove_foreign_key 'comments', 'posts'
  end
end
