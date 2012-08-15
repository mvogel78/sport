class AppointmentController < ActionController::Base
  protect_from_forgery
  include SessionsHelper

  def create
    @group = Group.find_by_id(@group.id)
    @dur =  (@group.ends_at - @group.starts_at).to_int / 7
    @apps = (1..@dur).collect { |x| @group.starts_at + (7*x).days } 
    @apps.each do |d|
      @newapp = Appointment.new(:group_id => params[:group][:id], :date_at => d)
      @newapp.save
    end
    redirect_to(:back)
  end
end
