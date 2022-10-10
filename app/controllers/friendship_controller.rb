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
    @friendship = Friendship.find(params[:request])

    if params[:accept]
      current_user.befriend(params[:friend])
    else
      @friendship.delete
    end
    respond_to do |format|
      format.turbo_stream
    end
  end
end
