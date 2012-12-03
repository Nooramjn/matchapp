require 'spec_helper'

describe "tickets/edit" do
  before(:each) do
    @ticket = assign(:ticket, stub_model(Ticket,
      :quantity => 1,
      :ticket_type => "MyString",
      :fan_id => 1,
      :match_id => 1
    ))
  end

  it "renders the edit ticket form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => tickets_path(@ticket), :method => "post" do
      assert_select "input#ticket_quantity", :name => "ticket[quantity]"
      assert_select "input#ticket_ticket_type", :name => "ticket[ticket_type]"
      assert_select "input#ticket_fan_id", :name => "ticket[fan_id]"
      assert_select "input#ticket_match_id", :name => "ticket[match_id]"
    end
  end
end
