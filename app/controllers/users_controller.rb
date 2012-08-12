class UsersController < ApplicationController
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



end
