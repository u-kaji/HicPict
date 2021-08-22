class PictsController < ApplicationController
  before_action :authenticate_user!, except[:index, :show]

  def index
  end

  def new
    @pict = pict.new
  end

  def pict_params
    params.require(:pict).permit(:name, :detail, :image).merge(user_id: current_user.id)
end
