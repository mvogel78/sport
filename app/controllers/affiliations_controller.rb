class AffiliationsController < ApplicationController
  def delete
  end

  def create
    @affil = Affiliation.new(group_id: params[:affiliation][:group_id], child_id: params[:affiliation][:child_id])
    if @affil.save
      flash[:success] = "Kind zu Gruppe hinzugefuegt"
      @affil.group.appointments.each do |appointment|
        @attendance = Attendance.new(:appointment_id => appointment.id, :child_id => @affil.child_id)
        @attendance.save
      end
    else
      flash[:error] = "Bitte korrigieren Sie!"
    end
    redirect_to(:back)
  end
end
