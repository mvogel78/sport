class GroupsController < ApplicationController
  before_filter :signed_in_user, only: [:create, :destroy]

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
  end


end
