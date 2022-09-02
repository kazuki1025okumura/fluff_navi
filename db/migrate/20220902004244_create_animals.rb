class CreateAnimals < ActiveRecord::Migration[6.1]
  def change
    create_table :animals do |t|
      t.string :name, null: false

      t.timestamps
    end
    add_index :animals, :name, unique: true
  end
end
