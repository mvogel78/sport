require 'spec_helper'

describe "User pages" do

  subject { page }

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
end


