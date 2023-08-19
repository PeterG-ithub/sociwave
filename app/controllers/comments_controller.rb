class CommentsController < ApplicationController
  def new
    @post = Post.find params[:post_id]
    @comment = @post.comments.build
  end

  def create
    @post = Post.find params[:post_id]
    @comment = current_user.comments.new(comments_params)
    @comment.post = @post
    if @comment.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def comments_params
    params.require(:comment).permit(:body)
  end
end
