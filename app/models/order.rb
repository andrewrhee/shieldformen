class Order < ActiveRecord::Base
  SHIPPING_METHOD = ["Free Shipping via USPS First Class! - FREE"]
  STATES = ["Alabama", "Alaska", "Arizona", "Arkansas", "California",
            "Colorado", "Connecticut", "Delaware", "Florida", "Georgia",
            "Hawaii", "Idaho", "Illinois", "Indiana", "Iowa", "Kansas",
            "Kentucky", "Louisiana", "Maine", "Maryland", "Massachusetts",
            "Michigan", "Minnesota", "Mississippi", "Missouri", "Montana",
            "Nebraska", "Nevada", "New Hampshire", "New Jersey", "New Mexico",
            "New York", "North Carolina", "North Dakota", "Ohio", "Oklahoma",
            "Oregon", "Pennsylvania", "Rhode Island", "South Carolina", 
            "South Dakota", "Tennessee", "Texas", "Utah", "Vermont", "Virginia",
            "Washington", "West Virginia", "Wisconsin", "Wyoming"]
  CARD_TYPES = [ "Visa", "MasterCard", "Discover" ]
  CARD_EXPIRATION_MONTHS = [ "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12" ]
  CARD_EXPIRATION_YEAR = [ "2012", "2013", "2014", "2015", "2016" ]

  attr_accessible :email, :phone_number, :ship_to_first_name, :ship_to_last_name,
  	:ship_to_address, :ship_to_city, :ship_to_state, :ship_to_postal_code,
  	:shipping, :action, :response
  attr_accessor  :card_type, :card_number, 
    :card_expiration_month, :card_expiration_year, :card_verification_value
  attr_protected :id, :customer_ip, :status, :error_message,
    :updated_at, :created_at

  has_many :line_items, dependent: :destroy
  has_many :transactions, :class_name => "OrderTransaction"
  has_many :discounts

  validates_presence_of :shipping

  validates_length_of :bill_to_first_name, :in => 2..255
  validates_length_of :bill_to_last_name, :in => 2..255
  validates_length_of :bill_to_address, :in => 2..255
  validates_length_of :bill_to_city, :in => 2..255
  validates_length_of :bill_to_state, :in => 2..255
  validates_length_of :bill_to_postal_code, :in => 2..255

  validates_length_of :ship_to_first_name, :in => 2..255
  validates_length_of :ship_to_last_name, :in => 2..255
  validates_length_of :ship_to_address, :in => 2..255
  validates_length_of :ship_to_city, :in => 2..255
  validates_length_of :ship_to_state, :in => 2..255
  validates_length_of :ship_to_postal_code, :in => 2..255


  validates_length_of :phone_number, :in => 7..20
  validates_length_of :customer_ip, :in => 7..15
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
  validates_inclusion_of :card_type, :in => ['Visa', 'MasterCard', 'Discover'], 
    :on => :create
  validates_length_of :card_number, :in => 13..19, :on => :create
  validates_inclusion_of :card_expiration_month, :in => %w(1 2 3 4 5 6 7 8 9 10 11 12), 
    :on => :create
  validates_inclusion_of :card_expiration_year, :in => %w(2012 2013 2014 2015 2016 2017 2018), 
    :on => :create
  validates_length_of :card_verification_value, :in => 3..4, :on => :create

  def add_line_items_from_cart(cart)
  	cart.line_items.each do |item|
  		item.cart_id = nil
  		line_items << item
  	end
  end

  def total_price
    line_items.to_a.sum { |item| item.total_price }
  end

  def discount_price
    total_price = line_items.to_a.sum { |item| item.total_price }
    total_price = total_price - (total_price * 0.30)
  end

  def purchase
    response = GATEWAY.purchase(price_in_cents, credit_card, purchase_options)
    transactions.create!(:action => "purchase", :amount => price_in_cents, 
      :response => response)
    if response.success?
      self.status = 'success'
      self.price = (price_in_cents/100)
      self.discount_code = discount_code
      self.discount_price = discount_price
    else
      self.status = 'failure'
      self.error_message = response.message
    end
    self.save!
    response.success?
  end

  def discount_purchase
    response = GATEWAY.purchase(discount_price_in_cents, credit_card, purchase_options)
    transactions.create!(:action => "purchase", :amount => price_in_cents, 
      :response => response)
    if response.success?
      self.status = 'success'
      self.price = (price_in_cents/100)
      self.discount_code = discount_code
      self.discount_price = discount_price
    else
      self.status = 'failure'
      self.error_message = response.message
    end
    self.save!
    response.success?
  end

  def price_in_cents
    # cart.line_items.each do |item|
    # total_price = item.price
    #end
    #(total_price * 100).round
    total_price * 100
  end


  def discount_price_in_cents
    # cart.line_items.each do |item|
    # total_price = item.price
    #end
    #(total_price * 100).round
    discount_price * 100
  end


  def purchase_options
    {
      :ip => customer_ip,
      :billing_address => {
        :name     => bill_to_first_name + " " + bill_to_last_name,
        :address1 => bill_to_address,
        :city     => bill_to_city,
        :zip      => bill_to_postal_code,
      },
      :shipping_address => {
        :name     => ship_to_first_name + " " + ship_to_last_name,
        :address1 => ship_to_address,
        :city     => ship_to_city,
        :zip      => ship_to_postal_code,
      }
    }
  end

  private

  def validate_card 
    unless credit_card.valid?
      credit_card.errors.full_messages.each do |message|
        errors.add_to_base_message
      end
    end
  end

  def credit_card
    @credit_card ||= ActiveMerchant::Billing::CreditCard.new(
      :type                   => card_type,
      :number                 => card_number,
      :verification_value     => card_verification_value,
      :month                  => card_expiration_month,
      :year                   => card_expiration_year,
      :first_name             => bill_to_first_name,
      :last_name              => bill_to_last_name
    )
  end
end
