require 'spec_helper'

describe "matches/edit" do
  before(:each) do
    @match = assign(:match, stub_model(Match,
      :match_type => "MyString",
      :home => false,
      :opponent_id => 1
    ))
  end

  it "renders the edit match form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => matches_path(@match), :method => "post" do
      assert_select "input#match_match_type", :name => "match[match_type]"
      assert_select "input#match_home", :name => "match[home]"
      assert_select "input#match_opponent_id", :name => "match[opponent_id]"
    end
  end
end
