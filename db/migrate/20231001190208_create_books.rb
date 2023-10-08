class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books, id: false do |t|

      t.string :title, null: false
      t.string :author, null: false
      t.date :sales_date, null: false
      t.text :item_caption, null: false
      t.string :large_image_url, null: false
      t.string :medium_image_url, null: false
      t.string :small_image_url, null: false
      t.string :item_url, null: false
      t.bigint :isbn, null: false, primary_key: true

      t.timestamps
    end
  end
end
