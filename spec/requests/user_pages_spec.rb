require 'spec_helper'

describe "UserPages" do

  describe "sign up page" do 
    it "should have the right title" do 
      get 'signup'
      response.should have_selector("title", :content => "Neuer Nutzer")
    end
  end
end
