class EvalsController < ApplicationController


  def index
    @evals = Evals.all
  end

  def new
    @hic = Hic.find(params[:hic_id])
    @pict = Pict.find(params[:pict_id])
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


  private

  def eval_params
    params.require(:eval).permit(:scene, :rhythm, :kigo, :tech, :original, :review).merge(user_id: current_user.id)
  end

end