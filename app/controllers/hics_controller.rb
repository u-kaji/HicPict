class HicsController < ApplicationController
  before_action :set_pict, only: [:create]

  def create
    @pict = Pict.find(params[:pict_id])
    @hic = Hic.new
    @hics = Hic.all
  end


  private

  def set_pict
    @pict = Pict.find(params[:pict_id])
  end


end
