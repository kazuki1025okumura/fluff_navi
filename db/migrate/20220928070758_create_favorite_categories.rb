class CreateFavoriteCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :favorite_categories do |t|
      t.references :user, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end

    add_index :favorite_categories, [:user_id, :category_id], unique: true
  end
end
