class ChildrenController < ApplicationController
  def new
    @child = Child.new
  end

  def edit
    @child = Child.find(params[:id])
  end

  def index
    @children = Child.paginate(page: params[:page], :per_page => 15)
  end

  def update
    @child = Child.find_by_id(params[:id])
    if @child.update_attributes(params[:child])
      flash[:success] = "Kind aktualisiert"
      redirect_to edit_child_path(@child)
    else
      flash[:error] = "Es ist ein Fehler aufgetreten"
      render 'edit'
    end
  end

end
