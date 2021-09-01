class PictsController < ApplicationController
  before_action :authenticate_user!, except:[:show]
  before_action :set_pict, only:[:show, :edit, :update, :destroy]

  def index
    @q = Pict.ransack(params[:q])
    @picts = @q.result(distinct: true).order(id:"desc")

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
    @hic = Hic.find_by(params[:hic_id])
    @hics = Hic.where(pict_id: @pict.id)
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

  def set_pict
    @pict = Pict.find(params[:id])
  end

  def pict_params
    params.require(:pict).permit(:title, :comment, :image).merge(user_id: current_user.id)
  end

  
end
