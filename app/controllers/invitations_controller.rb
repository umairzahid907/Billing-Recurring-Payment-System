class InvitationsController < Devise::InvitationsController
  def new
    if current_user.admin?
      super
    else
      flash[:alert] = 'You cannot perform this action'
      redirect_to root_path
    end
  end
end
