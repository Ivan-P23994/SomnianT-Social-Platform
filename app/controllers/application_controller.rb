# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:id, :first_name, :last_name, { profile_attributes: [:birth_day, :birth_month, :birth_year, :gender, :occupation, :birth_place] }]) #rubocop:disable Layout/LineLength
  end

  def after_sign_out_path_for(_resource)
    new_user_session_path
  end
end
