class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|

      t.string :title, null: false
      t.string :author, null: false
      t.string :sales_date, null: false
      t.text :item_caption, null: false
      t.string :large_image_url, null: false, default: ""
      t.string :medium_image_url, null: false, default: ""
      t.string :small_image_url, null: false, default: ""
      t.string :item_url, null: false, default: ""
      t.string :isbn, null: false

      t.timestamps
    end
  end
end
