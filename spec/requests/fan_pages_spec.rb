require 'spec_helper'

describe "Fan pages" do
  
  subject { page }

  describe "index" do
    #before do
      #sign_in FactoryGirl.create(:fan)
      #FactoryGirl.create(:fan, name: "Bob", email: "bob@example.com")
      #FactoryGirl.create(:fan, name: "Ben", email: "ben@example.com")
      #visit fans_path
    #end
    let(:fan) { FactoryGirl.create(:fan) }

    before do
      sign_in fan
      visit fans_path
    end

    it { should have_selector('title', text: 'All fans') }
    it { should have_selector('h1',    text: 'All fans') }

    it "should list each fan" do
      Fan.all.each do |fan|
        page.should have_selector('li', text: fan.name)
      end
    end
  end

  describe "edit" do
    let(:fan) { FactoryGirl.create(:fan) }
    before { visit edit_fan_path(fan) }

    before do
      sign_in fan
      visit edit_fan_path(fan)
    end
    
    describe "page" do
    
      it { should have_selector('h1',    text: "Update your profile") }
      it { should have_selector('title', text: "Edit fan") }
      #it { should have_link('change', href: 'http://gravatar.com/emails') }
    end

    describe "with invalid information" do
      before { click_button "Save changes" }

      it { should have_content('error') }
      
      
      describe "with valid information" do
      let(:new_name)  { "New Name" }
      let(:new_email) { "new@example.com" }
      before do
        fill_in "Name",             with: new_name
        fill_in "Email",            with: new_email
        fill_in "Password",         with: fan.password
        fill_in "Confirm Password", with: fan.password
        click_button "Save changes"
      end

      it { should have_selector('title', text: new_name) }
      it { should have_selector('div.alert.alert-success') }
      it { should have_link('Sign out', href: signout_path) }
      specify { fan.reload.name.should  == new_name }
      specify { fan.reload.email.should == new_email }
    end
  end
  
  describe "delete links" do

      it { should_not have_link('delete') }

      describe "as an admin fan" do
        let(:admin) { FactoryGirl.create(:admin) }
        before do
          sign_in admin
          visit fans_path
        end

        it { should have_link('delete', href: fan_path(Fan.first)) }
        it "should be able to delete another fan" do
          expect { click_link('delete') }.to change(Fan, :count).by(-1)
        end
        it { should_not have_link('delete', href: fan_path(admin)) }
      end
    end
  end
end