class AddKanjiToAnimals < ActiveRecord::Migration[6.1]
  def change
    add_column :animals, :kanji, :string
  end
end
