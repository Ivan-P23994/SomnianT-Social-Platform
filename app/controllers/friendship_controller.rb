class FriendshipController < ApplicationController
  def discover
    @users = current_user.not_friends?
  end

  def befriend
    current_user.befriend(params[:friend_id])
    redirect_to action: 'discover'
  end

  def show
    @fr_requests = current_user.not_responded_requests
  end

  def request_response
    if params[:accept]
      current_user.befriend(params[:friend])
    else
      Friendship.find(params[:request]).delete
    end
    redirect_to action: 'show'
  end
end
