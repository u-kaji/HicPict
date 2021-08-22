class PictsController < ApplicationController
  before_action :authenticate_user!, except[:index, :show]

  def index
  end

  def new
    @pict = pict.new
  end
end
