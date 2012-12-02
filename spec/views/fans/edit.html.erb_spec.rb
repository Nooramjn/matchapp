require 'spec_helper'

describe "fans/edit" do
  before(:each) do
    @fan = assign(:fan, stub_model(Fan,
      :name => "MyString",
      :email => "MyString"
    ))
  end

  it "renders the edit fan form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => fans_path(@fan), :method => "post" do
      assert_select "input#fan_name", :name => "fan[name]"
      assert_select "input#fan_email", :name => "fan[email]"
    end
  end
end
