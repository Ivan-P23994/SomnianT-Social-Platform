class ProfileController < ApplicationController
  def show
    @user = User.find(params[:id])
    @profile = @user.profile

    render :show, status: :ok
  end

  def edit
    @profile = current_user.profile
  end

  def update
    @profile = current_user.profile

    if @profile.update(profile_params)
      redirect_to action: 'show'
    else
      render json: { errors: profile.errors }, status: :bad_request
    end
  end

  private

  def profile_params
    params.require(:profile).permit(:user_id, :birth_year, :birth_day, :birth_month,
                                    :occupation, :gender, :birth_place, :image)
  end
end
