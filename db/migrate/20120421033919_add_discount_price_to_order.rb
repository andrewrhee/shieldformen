class AddDiscountPriceToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :discount_price, :decimal
  end
end
