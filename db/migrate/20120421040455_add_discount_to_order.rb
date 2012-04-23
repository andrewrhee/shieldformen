class AddDiscountToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :discount, :boolean
  end
end
