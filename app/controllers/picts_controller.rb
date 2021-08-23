class PictsController < ApplicationController
  before_action :authenticate_user!, except:[:index, :show]
  before_action :set_pict, only:[:show, :edit, :update, :destroy]

  def index
    @picts = Pict.all.order(id:"desc")
  end

  def new
    @pict = Pict.new
  end

  def create
    @pict = Pict.new(pict_params)
    if @pict.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @pict.update(pict_params)
      redirect_to pict_path
    else
      render :edit
    end
  end

  def destroy
    @pict.destroy
    redirect_to root_path
  end
    



  private

  def pict_params
    params.require(:pict).permit(:title, :comment, :image).merge(user_id: current_user.id)
  end

  def set_pict
    @pict = Pict.find(params[:id])
  end

end
