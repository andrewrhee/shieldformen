class CreateDiscounts < ActiveRecord::Migration
  def change
    create_table :discounts do |t|
      t.string :discount_code
      t.string :site_name
      t.string :site_url
      t.text :description
      t.integer :user_id
      t.integer :order_id

      t.timestamps
    end
  end
end
