require 'spec_helper'

describe "sizes/new" do
  before(:each) do
    assign(:size, stub_model(Size,
      :size => "MyString"
    ).as_new_record)
  end

  it "renders new size form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => sizes_path, :method => "post" do
      assert_select "input#size_size", :name => "size[size]"
    end
  end
end
