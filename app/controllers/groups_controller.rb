class GroupsController < ApplicationController
  before_filter :signed_in_user, only: [:create, :destroy, :update]

  def new
    @group = Group.new(:user_id => params[:id])
  end

  def index
  end

  def create
    @group = Group.new(params[:group])
    if @group.save
      flash[:success] = "Gruppe angelegt!"
      redirect_to User.find(params[:group][:user_id])
    else
      flash[:error] = "Gruppe konnte nicht angelegt werden!"
      redirect_to newgroup_path
    end
  end

  def destroy
  end

  def show
    @group = Group.find(params[:id])
  end

  def edit
    @group = Group.find(params[:id])
  end

  def update
    @group = Group.find_by_id(params[:id])
    if @group.update_attributes(params[:group])
      flash[:success] = "Gruppe updated"
      redirect_to children_path(params[:group][:user_id])
    else
      flash[:error] = "Es ist ein Fehler aufgetreten"
      render 'edit'
    end
  end
end
