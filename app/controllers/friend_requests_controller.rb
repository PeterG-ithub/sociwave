class FriendRequestsController < ApplicationController
  def index
  end

  def create
    sender = User.find(params[:sender_id])
    receiver = User.find(params[:receiver_id])
    puts receiver
    fr = current_user.friend_requests.build(sender: sender, receiver: receiver)
    fr.save
  end

  def destroy
  end
end
