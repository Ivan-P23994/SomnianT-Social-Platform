class DashboardController < ApplicationController
  def index
    @user = current_user
    @profile = current_user.profile
    @posts = Post.where(author_id: current_user.id)
  end
end
