require 'spec_helper'

describe "products/new" do
  before(:each) do
    assign(:product, stub_model(Product,
      :name => "MyString",
      :description => "MyText",
      :image_url => "MyString",
      :price => "9.99",
      :stock => 1,
      :size_id => 1
    ).as_new_record)
  end

  it "renders new product form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => products_path, :method => "post" do
      assert_select "input#product_name", :name => "product[name]"
      assert_select "textarea#product_description", :name => "product[description]"
      assert_select "input#product_image_url", :name => "product[image_url]"
      assert_select "input#product_price", :name => "product[price]"
      assert_select "input#product_stock", :name => "product[stock]"
      assert_select "input#product_size_id", :name => "product[size_id]"
    end
  end
end
