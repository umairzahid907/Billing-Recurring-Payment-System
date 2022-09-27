# frozen_string_literal: true

class InvitationsController < Devise::InvitationsController
  before_action :configure_permitted_parameters

  def new
    if current_user.admin?
      super
    else
      flash[:alert] = 'You cannot perform this action'
      redirect_to root_path
    end
  end

  protected

  # Permit the new params here.
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:invite, keys: %i[name avatar])
  end
end
