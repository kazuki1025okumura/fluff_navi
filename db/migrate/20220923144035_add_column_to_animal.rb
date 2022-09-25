class AddColumnToAnimal < ActiveRecord::Migration[6.1]
  def change
    add_column :animals, :icon, :string
  end
end
