class PictsController < ApplicationController
  before_action :authenticate_user!, except:[:index, :show]

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

    



  private

  def pict_params
    params.require(:pict).permit(:title, :comment, :image).merge(user_id: current_user.id)
  end
end
