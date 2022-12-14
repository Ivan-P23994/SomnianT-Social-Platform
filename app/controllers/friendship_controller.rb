class FriendshipController < ApplicationController
  def discover
    @users = current_user.not_friends?
  end

  def befriend
    current_user.befriend(params[:friend_id]) if params[:state] == 'accept'

    @friend = current_user.not_friends?.sample(1).first
    respond_to do |format|
      format.turbo_stream
    end
  end

  def show
    @fr_requests = current_user.not_responded_requests
  end

  def befriend_discovered_user
    current_user.befriend(params[:friend_id])

    @user = current_user.not_friends?.sample(1).first
    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: turbo_stream.replace("discovered_user_#{params[:friend_id]}",
                                                  partial: 'friendship/cards/user_card',
                                                  locals: { user: @user })
      end
    end
  end

  def request_response
    @friendship = Friendship.find(params[:request])

    params[:accept] ? current_user.befriend(params[:friend]) : @friendship.delete

    respond_to do |format|
      format.turbo_stream
    end
  end

  private

  def set_friendship
    @friendship = friendship.find(params[:id])
  end

  def friendship_params
    params.require(:friendship).permit(:user_id, :friend_id)
  end
end
