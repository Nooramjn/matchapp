require 'spec_helper'

describe Ticket do
	it "should have the correct association" do
  	should belong_to(:fan)
  	should belong_to(:match)
  end
  
  it "should have valid attributes" do
  	should validate_presence_of(:quantity)
  	should validate_presence_of(:ticket_type)
  	should validate_presence_of(:fan_id)
  	should validate_presence_of(:match_id)
  end
  
  describe "create our factories" do
  	before (:each) do
  		@match1= FactoryGirl.create(:match)
  		@match2=FactoryGirl.create(:match,:match_type =>"Friendly", :opponent_id =>1)
  		@opponent1=FactoryGirl.create(:opponent, :name=>"GOS", :skill_level=>"Moderate", :home_capacity=>"5543", :domestic=> true, :rival=>false)
  		@opponent2=FactoryGirl.create(:opponent)
  		@ticket1=FactoryGirl.create(:ticket)
  		@ticket2=FactoryGirl.create(:ticket, :quantity=>1, :ticket_type=>"VIP Box")
  		@sara= FactoryGirl.create(:fan)
  		@noora=FactoryGirl.create(:fan,:name =>"Noora")
  		@hawra=FactoryGirl.create(:fan,:name =>"Hawra", :email => "ha@hotmail.com")
  	end
  
  	it "should create the factories correctly" do
  		@match1.should be_valid
  		@match2.should be_valid
  		@opponent1.should be_valid
  		@opponent2.should be_valid
  		@ticket1.should be_valid
  		@ticket2.should be_valid
  		@sara.should be_valid
  		@noora.should be_valid
  		@hawra.should be_valid
  	end
end
