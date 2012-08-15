class AppointmentsController < ActionController::Base
  layout "application"
  protect_from_forgery
  include GroupsHelper

  def create
  end

  def new
    @appointment = Appointment.new(:group_id => params[:id])
  end

  def create
    @appointment = Appointment.new(params[:appointment])
    if @appointment.save
      flash[:success] = "Termin angelegt"
    else
      flash[:error] = "Fehler, anlegen nicht moeglich"
    end
    redirect_to(:back)
  end

  def show
    @appointment = Appointment.find(params[:id])
  end

end
