class ConfirmationController < ApplicationController
	force_ssl :only => :index
	skip_before_filter :authorize, only: :index

  def index
  	@cart = current_cart
  	
  end
end
