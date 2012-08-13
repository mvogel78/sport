class GroupsController < ApplicationController
  before_filter :signed_in_user, only: [:create, :destroy]

  def new
    @group = Group.new
  end

  def index
  end

  def create
    @group = this_user.groups.build(params[:group])
    if @group.save
      flash[:success] = "Gruppe angelegt!"
      redirect_to this_user
    else
      flash[:error] = "Gruppe konnte nicht angelegt werden!"
      redirect_to this_user
    end
  end

  def destroy
  end

  def show
  end


end
