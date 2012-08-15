class AffiliationsController < ApplicationController
  def delete
  end

  def create
    @affil = Affiliation.new(group_id: params[:affiliation][:group_id], child_id: params[:affiliation][:child_id])
    if @affil.save
      flash[:success] = "Kind zu Gruppe hinzugefuegt"
    else
      flash[:error] = "Bitte korrigieren Sie!"
    end
    redirect_to(:back)
  end
end
