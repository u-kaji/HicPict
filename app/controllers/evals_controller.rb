class EvalsController < ApplicationController

before_action :set_pict, only: [:new, :create, :show]
before_action :set_hic, only: [:new, :create, :show]

  def new
    @eval = Eval.new
  end

  def create
    @eval = Eval.new(eval_params)
    if @eval.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @evals = Eval.where(hic_id:@hic.id)
  end



  private

  def eval_params
    params.require(:eval).permit(:scene, :rhythm, :kigo, :tech, :original, :review).merge(user_id: current_user.id, pict_id:@pict.id, hic_id:@hic.id)
  end

  def set_pict
    @pict = Pict.find(params[:pict_id])
  end

  def set_hic
    @hic = Hic.find(params[:hic_id])
  end

end
