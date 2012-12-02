require 'spec_helper'

describe "fans/new" do
  before(:each) do
    assign(:fan, stub_model(Fan,
      :name => "MyString",
      :email => "MyString"
    ).as_new_record)
  end

  it "renders new fan form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => fans_path, :method => "post" do
      assert_select "input#fan_name", :name => "fan[name]"
      assert_select "input#fan_email", :name => "fan[email]"
    end
  end
end
