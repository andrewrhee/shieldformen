class Discount < ActiveRecord::Base
  attr_accessible :description, :discount_code, :order_id, :site_name, :site_url, :user_id

  belongs_to :user
  belongs_to :order

 
end
