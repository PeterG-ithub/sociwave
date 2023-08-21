class LikesController < ApplicationController
  def create
    post = Post.find(params[:post_id])
    like = current_user.likes.new(likable: post)
    like.save
  end

  private

  def likes_params
    params.required(:like).permit(:likable_id, :likable_type)
  end
end
