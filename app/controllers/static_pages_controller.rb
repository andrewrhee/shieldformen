class StaticPagesController < ApplicationController
	skip_before_filter :authorize
	
  def home
    @cart = current_cart
  end

  def works
    @cart = current_cart
  end

  def tips
    @cart = current_cart
  end

  def benefits
    @cart = current_cart
  end

  def moisturizers
    @cart = current_cart
  end

  def cleansers
    @cart = current_cart
  end

  def about
    @cart = current_cart
  end

  def values
    @cart = current_cart
  end

  def natural
    @cart = current_cart
  end

  def ingredients
    @cart = current_cart
  end

  def team
    @cart = current_cart
  end

  def jobs
    @cart = current_cart
  end

  def privacy
    @cart = current_cart
  end

  def shipping
    @cart = current_cart
  end

  def ccv2
    @cart = current_cart
  end
end
