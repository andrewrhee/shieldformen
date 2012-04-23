require 'spec_helper'

describe "sizes/edit" do
  before(:each) do
    @size = assign(:size, stub_model(Size,
      :size => "MyString"
    ))
  end

  it "renders the edit size form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => sizes_path(@size), :method => "post" do
      assert_select "input#size_size", :name => "size[size]"
    end
  end
end
