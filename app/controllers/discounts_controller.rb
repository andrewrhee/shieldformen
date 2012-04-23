class DiscountsController < ApplicationController
  skip_before_filter :authorize, only: :test
  # GET /discounts
  # GET /discounts.json
  def index
    @discounts = Discount.all
    @cart = current_cart
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @discounts }
    end
  end

  # GET /discounts/1
  # GET /discounts/1.json
  def show
    @discount = Discount.find(params[:id])
    @cart = current_cart
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @discount }
    end
  end

  # GET /discounts/new
  # GET /discounts/new.json
  def new
    @discount = Discount.new
    @cart = current_cart
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @discount }
    end
  end

  # GET /discounts/1/edit
  def edit
    @cart = current_cart
    @discount = Discount.find(params[:id])
  end


  # POST /discounts
  # POST /discounts.json
  def create
    @discount = Discount.new(params[:discount])
    @cart = current_cart
    respond_to do |format|
      if @discount.save
        format.html { redirect_to @discount, notice: 'Discount was successfully created.' }
        format.json { render json: @discount, status: :created, location: @discount }
      else
        format.html { render action: "new" }
        format.json { render json: @discount.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /discounts/1
  # PUT /discounts/1.json
  def update
    @discount = Discount.find(params[:id])
    @cart = current_cart
    respond_to do |format|
      if @discount.update_attributes(params[:discount])
        format.html { redirect_to @discount, notice: 'Discount was successfully updated.' }
        format.js
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.js
        format.json { render json: @discount.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /discounts/1
  # DELETE /discounts/1.json
  def destroy
    @discount = Discount.find(params[:id])
    @discount.destroy

    respond_to do |format|
      format.html { redirect_to discounts_url }
      format.json { head :no_content }
    end
  end

  # POST /discounts
  # POST /discounts.json
  def apply
    @cart = current_cart
    @order = Order.new(params[:order])
    @discounts = Discount.new(:discount_code => params[:discount][:discount_code])
    @discount = @discounts.discount_code.to_s

    unless Discount.find_by_discount_code(@discount).nil?
      @cart.discount_price
      session[:discount] = 'true'
      redirect_to new_order_path, notice: "Valid discount code"
    else
      redirect_to new_order_path, alert: "Invalid discount code"
    end 
  end

end
