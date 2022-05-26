class ListsController < ApplicationController
  before_action :set_list, only: [:show, :edit, :update]

  def index
    @lists = List.all
    if user_signed_in?
      @self_lists = List.where(user: current_user.id)
    end
  end

  def show
  end
    
  def new
    @list = List.new
  end
    
  def create
    @list = List.new(list_params)
    @list.user = current_user.id

    if @list.save
      redirect_to list_path(@list)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @list.update(list_params)
    redirect_to list_path(@list)
  end

  private

  def set_list
    @list = List.find(params[:id])
  end

  def list_params
    params.require(:list).permit(:name, :photo, :user)
  end
end
