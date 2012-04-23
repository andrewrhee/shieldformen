class Size < ActiveRecord::Base
  attr_accessible :size, :product_id

  belongs_to :produc
end
