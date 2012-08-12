class UsersController < ApplicationController
  before_filter :signed_in_user, only: [ :edit, :update, :index, :destroy ]
  before_filter :correct_user, only: [ :edit, :update ]

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User destroyed."
    redirect_to users_path
  end


  def index
    @users = User.paginate(page: params[:page], :per_page => 15)
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @title = "Neuer Nutzer"
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      sign_in @user
      flash[:success] = "Welcome to the App!"
      redirect_to @user
    else
      flash[:error] = "Bitte korrigieren Sie!"
      render 'new'
    end
  end

  def edit
  end

  def update
    if @user.update_attributes(params[:user])
      flash[:success] = "Profile updated"
      sign_in @user
      redirect_to @user
    else
      flash[:error] = "Es ist ein Fehler aufgetreten"
      render 'edit'
    end
  end

  private

  def signed_in_user
    store_location
    redirect_to signin_path, notice: "Please log in." unless signed_in?
  end

  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_path) unless current_user?(@user)
  end

end
