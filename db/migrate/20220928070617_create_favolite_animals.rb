class CreateFavoliteAnimals < ActiveRecord::Migration[6.1]
  def change
    create_table :favolite_animals do |t|
      t.references :user, null: false, foreign_key: true
      t.references :animal, null: false, foreign_key: true

      t.timestamps
    end

    add_index :favolite_animals, [:user_id, :animal_id], unique: true
  end
end
