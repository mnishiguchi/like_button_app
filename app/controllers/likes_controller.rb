class LikesController < ApplicationController
  before_action :authenticate_user! # Only a logged-in user can like posts.

  def create
    @post = Post.find(params[:post_id])
    @post.likes.where(user_id: current_user.id).first_or_create!

    respond_to do |format|
      format.html { redirect_to @post }
      format.js
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @post.likes.where(user_id: current_user.id).first_or_create!.destroy

    respond_to do |format|
      format.html { redirect_to @post }
      format.js
    end
  end

  private

    def like_params
      params.require(:like).permit(:post_id)
    end
end
