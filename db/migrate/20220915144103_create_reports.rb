class CreateReports < ActiveRecord::Migration[6.1]
  def change
    create_table :reports do |t|
      t.references :user, null: false, foreign_key: true
      t.references :facility, null: false, foreign_key: true
      t.text :admin_comment
      t.integer :content_id, null: false
      t.text :body, null: false
      t.string :image

      t.timestamps
    end
  end
end
