class CreateProfiles < ActiveRecord::Migration[7.0]
  def change
    create_table :profiles do |t|
      t.references :user, null: false, foreign_key: true
      t.string :birth_year
      t.string :birth_month
      t.string :birth_day
      t.string :gender
      t.string :occupation
      t.string :birth_place

      t.timestamps
    end
  end
end
