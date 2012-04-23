require 'spec_helper'

describe "sizes/index" do
  before(:each) do
    assign(:sizes, [
      stub_model(Size,
        :size => "Size"
      ),
      stub_model(Size,
        :size => "Size"
      )
    ])
  end

  it "renders a list of sizes" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Size".to_s, :count => 2
  end
end
