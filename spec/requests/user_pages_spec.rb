require 'spec_helper'

describe "User pages" do

  subject { page }

  describe "index" do
    let(:user) { FactoryGirl.create(:user) }

    before(:all) { 30.times { FactoryGirl.create(:user) } }
    after(:all)  { User.delete_all }    

    before(:each) do 
      sign_in user
      visit users_path
    end

#    it { should have_selector('title', text: 'All users') }
    it { should have_selector('h1',    text: 'Nutzerliste') }

    describe "pagination" do

      it { should have_selector('div.pagination') }

      it "should list each user" do
        User.paginate(page: 1).each do |user|
          page.should have_selector('li', text: user.lastname)
        end
      end
    end

    describe "delete links" do
      
      it { should_not have_link('delete') }

      describe "as an admin user" do
        let(:admin) { FactoryGirl.create(:admin) }
        before do
          sign_in admin
          visit users_path
        end

        it { should have_link('delete', href: user_path(User.first)) }
        it "should be able to delete another user" do
          expect { click_link('delete') }.to change(User, :count).by(-1)
        end
        it { should_not have_link('delete', href: user_path(admin)) }
      end
    end
  end

  describe "signup page" do
    before { visit signup_path }

    it { should have_selector('h1',    text: 'Neuer Nutzer') }
    it { should have_selector('title', text: 'Neuer Nutzer') }
  end

  describe "profile page" do 
    let(:user) { FactoryGirl.create(:user) }
    before { visit user_path(user) }
    
    it { should have_selector('h1', text: user.lastname ) }
    it { should have_selector('h1', text: user.firstname ) }
    it { should have_selector('title', text: 'Projekt Entwurf' ) }
  end


  describe "signup" do

    before { visit signup_path }

    let(:submit) { "Speichern" }

    describe "with invalid information" do
      it "should not create a user" do
        expect { click_button submit }.not_to change(User, :count)
      end
    end

    describe "with valid information" do
      before do
        fill_in "Lastname",         with: "Example User"
        fill_in "Email",        with: "user@example.com"
        fill_in "Password",     with: "foobar"
        fill_in "Confirmation", with: "foobar"
      end

      it "should create a user" do
        expect { click_button submit }.to change(User, :count).by(1)
      end
    end
  end

  describe "edit" do
    let(:user) { FactoryGirl.create(:user) }
    before do
      sign_in user
      visit edit_user_path(user) 
    end

    describe "page" do 
      it { should have_selector('h1',text: 'Nutzerinformationen bearbeiten') }
#      it { should have_selector('title', text: 'Edit User') }
      it { should have_link('change', href: 'http://gravatar.com/emails') }
    end
    
    describe "with invalid information" do 
      before { click_button "Save changes" } 
      it { should have_content('Fehler') }
    end
 describe "with valid information" do
      let(:new_lastname)  { "New Lastname" } 
      let(:new_firstname)  { "New Firstname" } 
      let(:new_email) { "new@example.com" }
      before do
        fill_in "Lastname",         with: new_lastname
        fill_in "Firstname",        with: new_firstname
        fill_in "Email",            with: new_email
        fill_in "Password",         with: user.password
        fill_in "Confirmation", with: user.password
        click_button "Save changes"
      end

#      it { should have_selector('title', text: new_name) }
#      it { should have_selector('div.alert.alert-success') }
      it { should have_link('LogOut', href: signout_path) }
      specify { user.reload.lastname.should  == new_lastname }
      specify { user.reload.firstname.should  == new_firstname }
      specify { user.reload.email.should == new_email }
    end
  end
end
