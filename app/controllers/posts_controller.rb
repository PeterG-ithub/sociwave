class PostsController < ApplicationController
  before_action :authenticate_user!
  def index
    @post = Post.all
  end
end
