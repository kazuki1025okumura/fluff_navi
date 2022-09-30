class AddColumnToFacility < ActiveRecord::Migration[6.1]
  def change
    add_column :facilities, :suggest, :integer, default: 0
  end
end
