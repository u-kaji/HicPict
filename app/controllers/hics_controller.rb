class HicsController < ApplicationController
  before_action :set_pict, only: [:new, :create]


  def new
    @hic = Hic.new
  end

  def create
    @pict = Pict.find(params[:pict_id])
    @hic = Hic.new(hic_params)
    if @hic.save
      redirect_to root_path
    else
      render :create
    end
  end


  private

  def set_pict
    @pict = Pict.find(params[:pict_id])
  end

  def hic_params
    params.require(:hic).permit(:hic, :kigo).merge(user_id: current_user.id, pict_id: @pict.id)
  end


end
