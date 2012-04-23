require 'spec_helper'

describe "discounts/edit" do
  before(:each) do
    @discount = assign(:discount, stub_model(Discount,
      :discount_code => "MyString",
      :site_name => "MyString",
      :site_url => "MyString",
      :description => "MyText",
      :user_id => 1,
      :order_id => 1
    ))
  end

  it "renders the edit discount form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => discounts_path(@discount), :method => "post" do
      assert_select "input#discount_discount_code", :name => "discount[discount_code]"
      assert_select "input#discount_site_name", :name => "discount[site_name]"
      assert_select "input#discount_site_url", :name => "discount[site_url]"
      assert_select "textarea#discount_description", :name => "discount[description]"
      assert_select "input#discount_user_id", :name => "discount[user_id]"
      assert_select "input#discount_order_id", :name => "discount[order_id]"
    end
  end
end
