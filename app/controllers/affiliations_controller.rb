class AffiliationsController < ApplicationController
  def delete
  end

  

  def create
    @affiliation = Affiliation.new(:child_id => params[:id], :group_id => [:group_id])
    @affiliation.save
    redirect_to users_path
  end
end
