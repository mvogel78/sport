class GroupsController < ApplicationController
  before_filter :signed_in_user, only: [:create, :destroy, :update]

  def new
    @group = Group.new(:user_id => params[:id])
  end

  def index
    @groups = Group.paginate(page: params[:page], :per_page => 15)
  end

  def create
    @group = Group.new(params[:group])
    if @group.save
      flash[:success] = "Gruppe angelegt!"
      @group.termseries.each do |t|
        @newapp = Appointment.new(:group_id => @group.id, :date_at => t)
        @newapp.save
      end
      redirect_to User.find(params[:group][:user_id])
    else
      flash[:error] = "Gruppe konnte nicht angelegt werden!"
      redirect_to new_group_path
    end
  end

  def destroy
  end

  def show
    @group = Group.find(params[:id])
    if @group.affiliations.count != 0
      @children = @group.children
    else
      @noc=0
    end
    if @group.appointments.count != 0
      @appointments = @group.appointments
    else
      @noa=0
    end

  end

  def edit
    @group = Group.find(params[:id])
    @appointments = @group.appointments
  end

  def update
    @group = Group.find_by_id(params[:id])
    if @group.update_attributes(params[:group])
      flash[:success] = "Gruppeninformationen aktualisiert"
      redirect_to(:back)
    else
      flash[:error] = "Es ist ein Fehler aufgetreten"
      render 'edit'
    end
  end
end
