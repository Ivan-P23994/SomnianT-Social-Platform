class CreateProfiles < ActiveRecord::Migration[7.0]
  def change
    create_table :profiles do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :age, null: false
      t.string :gender
      t.string :occupation
      t.string :birth_place

      t.timestamps
    end
  end
end
