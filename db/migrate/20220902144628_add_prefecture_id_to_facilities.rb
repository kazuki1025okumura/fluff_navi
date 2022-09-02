class AddPrefectureIdToFacilities < ActiveRecord::Migration[6.1]
  def change
    add_column :facilities, :prefecture_id, :integer
  end
end
