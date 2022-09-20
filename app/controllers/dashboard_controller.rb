class DashboardController < ApplicationController
  def index
    @user = current_user
    @profile = current_user.profile
  end
end
