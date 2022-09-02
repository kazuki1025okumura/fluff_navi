class CreateFacilityCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :facility_categories do |t|
      t.references :facility, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end

    add_index :facility_categories, [:facility_id, :category_id], unique: true
  end
end
