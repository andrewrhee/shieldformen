class AddDiscountCodeToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :discount_code, :string
  end
end
