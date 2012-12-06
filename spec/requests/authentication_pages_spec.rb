require 'spec_helper'

describe "AuthenticationPages" do
  describe "GET /authentication_pages" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get authentication_pages_index_path
      response.status.should be(200)
    end
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
      it { should have_link('Profile', href: fan_path(user)) }
      it { should have_link('Sign out', href: signout_path) }
      it { should_not have_link('Sign in', href: signin_path) }

      describe "after visiting another page" do
        before { click_link "Home" }
        it { should_not have_selector('div.alert.alert-error') }
      end
    end
  end
end
end
end
