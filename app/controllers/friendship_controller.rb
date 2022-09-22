class FriendshipController < ApplicationController
  def index
  end

  def discover
    @users = User.all.where.not(id: current_user.id).reject { |friend| friend.discover_filter(current_user) }
  end

  def befriend
    current_user.befriend(params[:id])
    redirect_back
  end
end
