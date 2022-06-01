class ListsController < ApplicationController
  before_action :set_list, only: [:show, :edit, :update]

  def index
    # @lists = List.all
    @lists = policy_scope(List).all
  
    if user_signed_in?
      @self_lists = List.where(user: current_user.id)
    end
  end

  def show
    authorize @list

    if user_signed_in?
      @user = User.where(id: current_user.id)
    end
  end
    
  def new
    @list = List.new
    authorize @list
  end
    
  def create
    @list = List.new(list_params)
    @list.user = current_user.id
    authorize @list

    if @list.save
      redirect_to list_path(@list)
    else
      render :new
    end
  end

  def edit
    authorize @list
  end

  def update
    @list.update(list_params)
    redirect_to list_path(@list)
  end

  def destroy
    @list = List.find(params[:id])

    @list.destroy
    redirect_to root_path
  end

  private

  def set_list
    @list = List.find(params[:id])
  end

  def list_params
    params.require(:list).permit(:name, :photo, :user)
  end
end
