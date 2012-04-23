require 'spec_helper'

describe "discounts/show" do
  before(:each) do
    @discount = assign(:discount, stub_model(Discount,
      :discount_code => "Discount Code",
      :site_name => "Site Name",
      :site_url => "Site Url",
      :description => "MyText",
      :user_id => 1,
      :order_id => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Discount Code/)
    rendered.should match(/Site Name/)
    rendered.should match(/Site Url/)
    rendered.should match(/MyText/)
    rendered.should match(/1/)
    rendered.should match(/2/)
  end
end
