require 'spec_helper'

describe "fans/index" do
  before(:each) do
    assign(:fans, [
      stub_model(Fan,
        :name => "Name",
        :email => "Email"
      ),
      stub_model(Fan,
        :name => "Name",
        :email => "Email"
      )
    ])
  end

  it "renders a list of fans" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
  end
end
