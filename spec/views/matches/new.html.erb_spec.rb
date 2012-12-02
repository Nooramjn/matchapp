require 'spec_helper'

describe "matches/new" do
  before(:each) do
    assign(:match, stub_model(Match,
      :type => "",
      :home => false,
      :opponent_id => 1
    ).as_new_record)
  end

  it "renders new match form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => matches_path, :method => "post" do
      assert_select "input#match_type", :name => "match[type]"
      assert_select "input#match_home", :name => "match[home]"
      assert_select "input#match_opponent_id", :name => "match[opponent_id]"
    end
  end
end
