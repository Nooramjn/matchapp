require 'spec_helper'

describe "opponents/show" do
  before(:each) do
    @opponent = assign(:opponent, stub_model(Opponent,
      :name => "Name",
      :skill_level => "Skill Level",
      :home_capacity => 1,
      :domestic => false,
      :rival => false
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/Skill Level/)
    rendered.should match(/1/)
    rendered.should match(/false/)
    rendered.should match(/false/)
  end
end
