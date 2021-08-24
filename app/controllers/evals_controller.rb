class EvalsController < ApplicationController

  def new
    @hic = Hic.new
    @pict = Pict.find(params[:id])
  end
end
