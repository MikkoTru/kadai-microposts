class FavoritesController < ApplicationController
  before_action :require_user_logged_in
 
  def create
    micropost = Micropost.find(params[:micropost_id])
    current_user.like(micropost)
    flash[:success] = '投稿をいいね！しました。'
    redirect_to current_user
  end

  def destroy
    micropost = Micropost.find(params[:micropost_id])
    current_user.unlike(micropost)
    flash[:success] = '投稿のいいね！を外しました。'
    redirect_to current_user
  end
end
