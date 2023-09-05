class LikesController < ApplicationController
  def create
    post = Post.find(params[:post_id]) if params[:post_id]
    comment = Comment.find(params[:comment_id]) if params[:comment_id]
    like = current_user.likes.new(likable: post) if params[:post_id]
    like = current_user.likes.new(likable: comment) if params[:comment_id]
    like.save
  end

  def destroy
    like = Like.find(params[:id])
    if like.destroy
      flash[:success] = 'like was successfully deleted.'
    else
      flash[:error] = 'Failed to delete the like.'
    end
  end
end
