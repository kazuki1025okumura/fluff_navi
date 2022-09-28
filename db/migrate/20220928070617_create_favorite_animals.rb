class CreateFavoriteAnimals < ActiveRecord::Migration[6.1]
  def change
    create_table :favorite_animals do |t|
      t.references :user, null: false, foreign_key: true
      t.references :animal, null: false, foreign_key: true

      t.timestamps
    end

    add_index :favorite_animals, [:user_id, :animal_id], unique: true
  end
end
