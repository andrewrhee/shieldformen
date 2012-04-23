require 'spec_helper'

describe "discounts/index" do
  before(:each) do
    assign(:discounts, [
      stub_model(Discount,
        :discount_code => "Discount Code",
        :site_name => "Site Name",
        :site_url => "Site Url",
        :description => "MyText",
        :user_id => 1,
        :order_id => 2
      ),
      stub_model(Discount,
        :discount_code => "Discount Code",
        :site_name => "Site Name",
        :site_url => "Site Url",
        :description => "MyText",
        :user_id => 1,
        :order_id => 2
      )
    ])
  end

  it "renders a list of discounts" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Discount Code".to_s, :count => 2
    assert_select "tr>td", :text => "Site Name".to_s, :count => 2
    assert_select "tr>td", :text => "Site Url".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
