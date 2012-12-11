require 'spec_helper'

describe "AuthenticationPages" do
  describe "GET /authentication_pages" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get authentication_pages_index_path
      response.status.should be(200)
    end
  end
 #I added this part from 9.27 
  describe "with valid information" do
      let(:fan) { FactoryGirl.create(:fan) }
      before { sign_in fan }

      it { should have_selector('title', text: fan.name) }

      it { should have_link('Fans',    href: fans_path) }
      it { should have_link('Profile',  href: fan_path(fan)) }
      it { should have_link('Settings', href: edit_fan_path(fan)) }
      it { should have_link('Sign out', href: signout_path) }

      it { should_not have_link('Sign in', href: signin_path) }
      end

subject { page }

  describe "signin page" do
    before { visit signin_path }

   	describe "with invalid information" do
      before { click_button "Sign in" }

      it { should have_selector('title', text: 'Sign in') }
      it { should have_selector('div.alert.alert-error', text: 'Invalid') }

      describe "with valid information" do
      let(:fan) { FactoryGirl.create(:fan) }
      before do
        fill_in "Email",    with: fan.email
        fill_in "Password", with: fan.password
        click_button "Sign in"
      end

      it { should have_selector('title', text: fan.name) }
      it { should have_link('Profile', href: fan_path(fan)) }
      it { should have_link('Settings', href: edit_fan_path(fan)) }
      it { should have_link('Sign out', href: signout_path) }
      it { should_not have_link('Sign in', href: signin_path) }

      describe "after visiting another page" do
        before { click_link "Home" }
        it { should_not have_selector('div.alert.alert-error') }
      end
    end
  end
end


describe "authorization" do

  describe "as non-admin fan" do
      let(:fan) { FactoryGirl.create(:fan) }
      let(:non_admin) { FactoryGirl.create(:fan) }

      before { sign_in non_admin }

      describe "submitting a DELETE request to the Fans#destroy action" do
        before { delete fan_path(fan) }
        specify { response.should redirect_to(root_path) }        
      end
     end

    describe "for non-signed-in fans" do
      let(:fan) { FactoryGirl.create(:fan) }
      
	 describe "when attempting to visit a protected page" do
          before do
          visit edit_fan_path(fan)
          fill_in "Email",    with: fan.email
          fill_in "Password", with: fan.password
          click_button "Sign in"
        end

        describe "after signing in" do

          it "should render the desired protected page" do
            page.should have_selector('title', text: 'Edit fan')
          end
        end
      end
      describe "in the Fans controller" do
		
		describe "visiting the fan index" do
          before { visit fans_path }
          it { should have_selector('title', text: 'Sign in') }
        end
		
        describe "visiting the edit page" do
          before { visit edit_fan_path(fan) }
          it { should have_selector('title', text: 'Sign in') }
        end

        describe "submitting to the update action" do
          before { put fan_path(fan) }
          specify { response.should redirect_to(signin_path) }
        end
        
      end
    end
    describe "as wrong fan" do
      let(:fan) { FactoryGirl.create(:fan) }
      let(:wrong_fan) { FactoryGirl.create(:fan, email: "wrong@example.com") }
      before { sign_in fan }

      describe "visiting Fans#edit page" do
        before { visit edit_fan_path(wrong_fan) }
        it { should_not have_selector('title', text: full_title('Edit fan')) }
      end

      describe "submitting a PUT request to the Fans#update action" do
        before { put fan_path(wrong_fan) }
        specify { response.should redirect_to(root_path) }
      end
    end
  end
end
