require 'spec_helper'

describe "opponents/index" do
  before(:each) do
    assign(:opponents, [
      stub_model(Opponent,
        :name => "Name",
        :skill_level => "Skill Level",
        :home_capacity => 1,
        :domestic => false,
        :rival => false
      ),
      stub_model(Opponent,
        :name => "Name",
        :skill_level => "Skill Level",
        :home_capacity => 1,
        :domestic => false,
        :rival => false
      )
    ])
  end

  it "renders a list of opponents" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Skill Level".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
