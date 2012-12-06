require 'spec_helper'

describe Fan do
  before { @fan = Fan.new(name: "Example User", email: "user@example.com",
  password: "foobar", password_confirmation: "foobar") }

  subject { @fan }

  it { should respond_to(:name) }
  it { should respond_to(:email) }
  it { should respond_to(:password_digest) }
  it { should respond_to(:password) }
  it { should respond_to(:password_confirmation) }
<<<<<<< HEAD
   it { should respond_to(:authenticate) }
  it { should be_valid }
  

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
  
    describe "when password is not present" do
    before { @user.password = @user.password_confirmation = " " }
=======
  it { should respond_to(:authenticate) }
  it { should be_valid }
  
    describe "when password is not present" do
    before { @fan.password = @fan.password_confirmation = " " }
>>>>>>> e0a1c56cead78d1558ab429879ca66bad695e3a0
    it { should_not be_valid }
  end

  describe "when password doesn't match confirmation" do
<<<<<<< HEAD
    before { @user.password_confirmation = "mismatch" }
=======
    before { @fan.password_confirmation = "mismatch" }
>>>>>>> e0a1c56cead78d1558ab429879ca66bad695e3a0
    it { should_not be_valid }
  end

  describe "when password confirmation is nil" do
<<<<<<< HEAD
    before { @user.password_confirmation = nil }
=======
    before { @fan.password_confirmation = nil }
>>>>>>> e0a1c56cead78d1558ab429879ca66bad695e3a0
    it { should_not be_valid }
  end
  
  describe "with a password that's too short" do
<<<<<<< HEAD
    before { @user.password = @user.password_confirmation = "a" * 5 }
=======
    before { @fan.password = @fan.password_confirmation = "a" * 5 }
>>>>>>> e0a1c56cead78d1558ab429879ca66bad695e3a0
    it { should be_invalid }
  end

  describe "return value of authenticate method" do
<<<<<<< HEAD
    before { @user.save }
    let(:found_user) { User.find_by_email(@user.email) }

    describe "with valid password" do
      it { should == found_user.authenticate(@user.password) }
    end

    describe "with invalid password" do
      let(:user_for_invalid_password) { found_user.authenticate("invalid") }

      it { should_not == user_for_invalid_password }
      specify { user_for_invalid_password.should be_false }
=======
    before { @fan.save }
    let(:found_user) { Fan.find_by_email(@fan.email) }

    describe "with valid password" do
      it { should == found_user.authenticate(@fan.password) }
    end

    describe "with invalid password" do
      let(:fan_for_invalid_password) { found_user.authenticate("invalid") }

      it { should_not == user_for_invalid_password }
      specify { fan_for_invalid_password.should be_false }
>>>>>>> e0a1c56cead78d1558ab429879ca66bad695e3a0
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
  
<<<<<<< HEAD
=======
  describe "remember token" do
    before { @fan.save }
    its(:remember_token) { should_not be_blank }
  end
>>>>>>> e0a1c56cead78d1558ab429879ca66bad695e3a0
  
  describe "when email address is already taken" do
    before do
      fan_with_same_email = @fan.dup
      fan_with_same_email.email = @fan.email.upcase
      fan_with_same_email.save
    end

    it { should_not be_valid }
  end
end
