class OrderTransaction < ActiveRecord::Base
  attr_accessible :action, :response, :amount, :authorization, :message, :order_id, 
  	:params, :success

  belongs_to :order
  serialize :params

  def response=(response)
		self.success 				= response.success?
		self.authorization	= response.authorization
		self.message				= response.message
		self.params					= response.params
	rescue ActiveMerchant::ActiveMerchantError => e 
		self.success				= false
		self.authorization	= nil
		self.message				= e.message
		self.params					= {}
	end

end
