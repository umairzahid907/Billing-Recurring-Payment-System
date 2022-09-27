# frozen_string_literal: true

RailsAdmin.config do |config|
  config.authorize_with do
    if user_signed_in?
      unless current_user.admin?
        flash[:alert] = 'You do not have access.'
        redirect_to main_app.root_path
      end
    else
      flash[:alert] = 'You must be signed in.'
      redirect_to main_app.root_path
    end
  end

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end
end
