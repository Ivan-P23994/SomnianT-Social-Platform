class SearchController < ApplicationController
  def index
    @users = User.where("first_name LIKE ?", "#{params[:query]}".capitalize + "%")
  end

end
