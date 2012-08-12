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
      it { should have_link('LogOut', href: signout_path) }
      it { should have_link('Settings', href: edit_user_path(user)) }
#      it { should_not have_link('LogIn', href: signin_path) }
      it { should_not have_link('Sign in', href: signin_path) }

      describe "followed by signout" do
        before { click_link "LogOut" }
        it { should have_link('LogIn') }
      end
    end
  end

 describe "authorization" do

    describe "for non-signed-in users" do
      let(:user) { FactoryGirl.create(:user) }

      describe "when attempting to visit a protected page" do
        before do
          visit edit_user_path(user)
          fill_in "Email",    with: user.email
          fill_in "Password", with: user.password
          click_button "LogIn"
        end
        describe "after signing in" do
          it "should render the desired protected page" do
            page.should have_selector('h1', text: 'Nutzerinformationen bearbeiten')
          end
        end
      end


      describe "in the Users controller" do

      describe "visiting the user index" do
        before { visit users_path }
        it { should have_selector('h1', text: 'Nutzer') }
      end

        describe "visiting the edit page" do
          before { visit edit_user_path(user) }
          it { should have_selector('h1', text: 'LogIn') }
        end
        
        describe "submitting to the update action" do
          before { put user_path(user) }
          specify { response.should redirect_to(signin_path) }
        end
      end
    end

  describe "as wrong user" do
      let(:user) { FactoryGirl.create(:user) }
      let(:wrong_user) { FactoryGirl.create(:user, email: "wrong@example.com") }
      before { sign_in user }

      describe "visiting Users#edit page" do
        before { visit edit_user_path(wrong_user) }
        it { should_not have_selector('title', text: full_title('Edit user')) }
      end

      describe "submitting a PUT request to the Users#update action" do
        before { put user_path(wrong_user) }
        specify { response.should redirect_to(root_path) }
      end
    end
  end
end
