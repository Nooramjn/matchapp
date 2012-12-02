require 'spec_helper'

describe "opponents/edit" do
  before(:each) do
    @opponent = assign(:opponent, stub_model(Opponent,
      :name => "MyString",
      :skill_level => "MyString",
      :home_capacity => 1,
      :domestic => false,
      :rival => false
    ))
  end

  it "renders the edit opponent form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => opponents_path(@opponent), :method => "post" do
      assert_select "input#opponent_name", :name => "opponent[name]"
      assert_select "input#opponent_skill_level", :name => "opponent[skill_level]"
      assert_select "input#opponent_home_capacity", :name => "opponent[home_capacity]"
      assert_select "input#opponent_domestic", :name => "opponent[domestic]"
      assert_select "input#opponent_rival", :name => "opponent[rival]"
    end
  end
end
