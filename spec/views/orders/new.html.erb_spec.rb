require 'spec_helper'

describe "orders/new" do
  before(:each) do
    assign(:order, stub_model(Order,
      :email => "MyString",
      :phone_number => "MyString"
    ).as_new_record)
  end

  it "renders new order form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => orders_path, :method => "post" do
      assert_select "input#order_email", :name => "order[email]"
      assert_select "input#order_phone_number", :name => "order[phone_number]"
    end
  end
end
