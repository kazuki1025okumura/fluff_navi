class AddColumnToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :icon_id, :integer
  end
end
