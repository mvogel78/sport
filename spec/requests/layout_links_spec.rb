require 'spec_helper'

describe "Static pages" do

  subject { page }

  describe "Home page" do
    before { visit home_path }

    it { should have_selector('h1',    text: 'Projekt Entwurf') }
    it { should have_selector('title', text: 'Projekt Entwurf') }
    it { should have_selector 'title', text: '| Home' }
  end

  describe "Help page" do
    before { visit help_path }
    it { should have_selector('h1',    text: 'Hilfe') }
    it { should have_selector('title', text: full_title('Help')) }
  end

  describe "About page" do
    before { visit about_path }

    it { should have_selector('h1',    text: 'About') }
    it { should have_selector('title', text: full_title('About')) }
  end

  describe "Contact page" do
    before { visit contact_path }

    it { should have_selector('h1',    text: 'Kontakt') }
    it { should have_selector('title', text: full_title('Kontakt')) }
  end
end
