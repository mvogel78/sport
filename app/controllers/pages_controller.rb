class PagesController < ApplicationController
  def home
    @title = "Home"
  end

  def contact
    @title = "Kontakt"
  end

  def about
    @title = "About"
  end
end
