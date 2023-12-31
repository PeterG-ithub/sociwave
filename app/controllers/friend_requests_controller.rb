class FriendRequestsController < ApplicationController
  def index
    @friend_requests = current_user.friend_requests
  end

  def create
    sender = User.find(params[:sender_id])
    receiver = User.find(params[:receiver_id])
    puts receiver
    fr = current_user.friend_requests.build(sender: sender, receiver: receiver)
    fr.save
  end

  def destroy
    friend_request = FriendRequest.find(params[:id])
    friend_request.destroy
    redirect_to friend_requests_path
  end
end
