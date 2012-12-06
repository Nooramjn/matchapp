require 'spec_helper'

describe Opponent do

  it "should have valid attributes" do
  	should validate_presence_of(:name)
  	should validate_presence_of(:skill_level)
  	should validate_presence_of(:home_capacity)
  	should validate_presence_of(:domestic)
  	should validate_presence_of(:rival)
  end
  
  describe "create our factories" do
  	before (:each) do
  		@opponent1=FactoryGirl.create(:opponent, :name=>"GOS", :skill_level=>"Moderate", :home_capacity=>"5543", :domestic=> true, :rival=>false)
  		@opponent2=FactoryGirl.create(:opponent)
  	end
  
  	it "should create the factories correctly" do
  		@opponent1.should be_valid
  		@opponent2.should be_valid
  	end
end
