class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.string :image_url
      t.decimal :price, precision: 8, scale: 2
      t.integer :stock
      t.integer :size_id

      t.timestamps
    end
  end
end
