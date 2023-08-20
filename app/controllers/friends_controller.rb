class FriendsController < ApplicationController
  def index
  end

  def create
    friend = User.find(params[:friend])
    new_friend = current_user.friends.build(friend: friend)
    new_friend.save
    redirect_to friends_path
  end

  def destroy
  end
end
