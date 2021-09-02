class LikesController < ApplicationController
  
  def create
    @like = current_user.likes.create(pict_id: params[:pict_id])
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @like = Like.find_by(pict_id: params[:pict_id], user_id: current_user.id)
    @like.destroy
    redirect_back(fallback_location: root_path)
  end
end

