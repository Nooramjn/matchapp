require 'spec_helper'

describe Fan do
  before { @fan = Fan.new(name: "Example User", email: "user@example.com",
  password: "foobar123", password_confirmation: "foobar123") }

  subject { @fan }

  it { should respond_to(:name) }
  it { should respond_to(:email) }
  it { should respond_to(:password_digest) }
  it { should respond_to(:password) }
  it { should respond_to(:password_confirmation) }
#9.39
   it { should respond_to(:authenticate) }
   it { should be_valid }
   
   
  it { should respond_to(:admin) }
  it { should respond_to(:authenticate) }

  it { should be_valid }
  it { should_not be_admin }

  describe "with admin attribute set to 'true'" do
    before do
      @fan.save!
      @fan.toggle!(:admin)
    end

    it { should be_admin }
  end

  describe "create our factories" do
  	before (:each) do
  		@sara= FactoryGirl.create(:fan)
  		@noora=FactoryGirl.create(:fan,:name =>"Noora")
  		@hawra=FactoryGirl.create(:fan,:name =>"Hawra", :email => "ha@hotmail.com")
  	end
  
  	it "should create the factories correctly" do
  		@sara.should be_valid
  		@noora.should be_valid
  		@hawra.should be_valid
  	end
  
  it "should have valid attributes"do
  		@sara.name.should=="Sara"
  		@noora.name.should=="Noora"
  		@hawra.name.should=="Hawra"
  	end
end
  
    describe "when password is not present" do
    before { @fan.password = @fan.password_confirmation = " " }
    it { should_not be_valid }
  end

  describe "when password doesn't match confirmation" do

    before { @fan.password_confirmation = "mismatch" }
    it { should_not be_valid }
  end

  describe "when password confirmation is nil" do

    before { @fan.password_confirmation = nil }
    it { should_not be_valid }
  end
  
  describe "with a password that's too short" do
    before { @fan.password = @fan.password_confirmation = "a" * 5 }
    it { should be_invalid }
  end

  describe "return value of authenticate method" do

    before { @fan.save }
    let(:found_user) { Fan.find_by_email(@fan.email) }

    describe "with valid password" do
      it { should == found_user.authenticate(@fan.password) }
    end

    describe "with invalid password" do
      let(:fan_for_invalid_password) { found_user.authenticate("invalid") }

      it { should_not == user_for_invalid_password }
      specify { fan_for_invalid_password.should be_false }
    end
  end
  
  describe "when name is not present" do
    before { @fan.name = " " }
    it { should_not be_valid }
  end
  
  describe "when email is not present" do
    before { @fan.email = " " }
    it { should_not be_valid }
  end
  
  describe "when name is too long" do
    before { @fan.name = "a" * 51 }
    it { should_not be_valid }
  end
  
  
  
  describe "when email format is invalid" do
    it "should be invalid" do
      addresses = %w[fan@foo,com fan_at_foo.org example.fan@foo.
                     foo@bar_baz.com foo@bar+baz.com]
      addresses.each do |invalid_address|
        @fan.email = invalid_address
        @fan.should_not be_valid
      end      
    end
  end

  describe "when email format is valid" do
    it "should be valid" do
      addresses = %w[fan@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn]
      addresses.each do |valid_address|
        @fan.email = valid_address
        @fan.should be_valid
      end      
    end
  end
  
  
  describe "when email address is already taken" do
    before do
      fan_with_same_email = @fan.dup
      fan_with_same_email.save
    end

    it { should_not be_valid }
  end
  

  describe "remember token" do
    before { @fan.save }
    its(:remember_token) { should_not be_blank }
  end
  
  describe "when email address is already taken" do
    before do
      fan_with_same_email = @fan.dup
      fan_with_same_email.email = @fan.email.upcase
      fan_with_same_email.save
    end

    it { should_not be_valid }
  end
end
