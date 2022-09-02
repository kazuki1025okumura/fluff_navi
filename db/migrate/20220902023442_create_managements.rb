class CreateManagements < ActiveRecord::Migration[6.1]
  def change
    create_table :managements do |t|
      t.references :facility, null: false, foreign_key: true
      t.references :animal, null: false, foreign_key: true

      t.timestamps
    end

    add_index :managements, [:facility_id, :animal_id], unique: true
  end
end