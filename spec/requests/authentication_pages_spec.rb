require 'spec_helper'

describe "AuthenticationPages" do

  subject{ page }

  describe "signin page" do
    before{ visit signin_path }
    
    it { should have_selector('h1', text: 'LogIn') }
    it { should have_selector('title', text: 'LogIn') }
  end

  describe "sign in" do
    before{ visit signin_path }
    
    describe "sign in: invalid information" do
      before{ click_button "LogIn" }
    
      it { should have_selector('title', text: 'LogIn') }
      # it { should have_selector('div.alert.alert-error', text: 'Invalid') }

      describe "after visiting another page" do
        before { click_link "Home" }
        # it { should_not have_selector('div.alert.alert-error') }
      end
    end

    describe "valid information" do 
      let(:user) { FactoryGirl.create(:user) }
      before do 
        fill_in "Email", with: user.email
        fill_in "Password", with: user.password
        click_button "LogIn"
      end
        
      it { should have_selector('title', text: 'Projekt' ) }
#      it { should have_link('Profile', href: user_path(user)) }
#      it { should have_link('LogOut', href: signout_path) }
#      it { should_not have_link('LogIn', href: signin_path) }

      describe "followed by signout" do
        before { click_link "LogOut" }
        it { should have_link('LogIn') }
      end
    end
  end
end
