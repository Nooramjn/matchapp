require 'spec_helper'
#I added this from 9.23 book

describe "Fan pages" do

  subject { page }

  describe "index" do
    before do
      sign_in FactoryGirl.create(:fan)
      FactoryGirl.create(:fan, name: "Bob", email: "bob@example.com")
      FactoryGirl.create(:fan, name: "Ben", email: "ben@example.com")
      visit users_path
    end

    it { should have_selector('title', text: 'All fans') }
    it { should have_selector('h1',    text: 'All fans') }

    it "should list each fan" do
      Fan.all.each do |fan|
        page.should have_selector('li', text: fan.name)
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
    
    #This part is related to pagination, which i didnt do it
    #describe "pagination" do

     # before(:all) { 30.times { FactoryGirl.create(:fan) } }
   #   after(:all)  { Fan.delete_all }

    #  it { should have_selector('div.pagination') }

    #  it "should list each fan" do
     #   Fan.paginate(page: 1).each do |fan|
      #    page.should have_selector('li', text: fan.name)
     #   end
    #  end
   # end
  end



describe "Fans" do
  describe "GET /fans" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get fans_path
      response.status.should be(200)
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
    end
    
    
  end
  
end
