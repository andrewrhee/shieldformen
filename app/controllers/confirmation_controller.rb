class ConfirmationController < ApplicationController
	force_ssl :only => :index

  def index
  	@cart = current_cart
  end
end
