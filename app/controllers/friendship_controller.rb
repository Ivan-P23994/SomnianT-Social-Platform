class FriendshipController < ApplicationController
  def index
  end

  def discover
    @users = current_user.not_friends?
  end

  def befriend
    current_user.befriend(params[:friend_id])
    redirect_to action: 'discover'
  end

  def friend_requests
    @fr_requests = current_user.received_friendships
  end
end
