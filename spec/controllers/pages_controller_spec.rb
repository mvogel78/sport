require 'spec_helper'

describe PagesController do
  render_views  

  describe "GET 'home'" do
    it "should have the h1 'Sample App'" do
      visit home_path
      page.should have_selector('h1', :text => full_title('Home'))
    end
  end


  describe "GET 'contact'" do
    it "should have the h1 'Projekt Entwurf'" do
      visit contact_path
      page.should have_selector('h1', :text => full_title('Kontakt'))
    end
  end

  describe "GET 'about'" do
    it "should have the h1 'Projekt Entwurf'" do
      visit about_path
      page.should have_selector('h1', :text => full_title('About'))
    end
  end

  describe "GET 'help'" do
    it "should have the h1 'Projekt Entwurf'" do
      visit help_path
      page.should have_selector('h1', :text => full_title('Hilfe'))
    end
  end

end

    
