class CreateFacilities < ActiveRecord::Migration[6.1]
  def change
    create_table :facilities do |t|
      t.string :name, null: false
      t.text :description
      t.string :close_day
      t.string :opening_hours
      t.string :tel_number
      t.string :address
      t.string :access
      t.string :parking
      t.string :price
      t.string :web_site
      t.text :remarks

      t.timestamps
    end
  end
end
