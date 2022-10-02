class DashboardController < ApplicationController
  def index
    @user = current_user
    @profile = @user.profile
    @posts = @user.dashboard_posts.order(created_at: :desc)
  end
end
