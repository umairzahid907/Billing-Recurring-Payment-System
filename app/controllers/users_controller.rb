class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update destroy]

  def index
    @user = User.all
  end

  def show
  end

  def edit
  end

  def destroy
    if @user.destroy
      redirect_to users_url, notice: 'User was successfully destroyed.'
    else
      flash[:alert] = 'Could not find thie user.'
      redirect_to users_url
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    flash[:alert] = "This User doesn't exist!"
    redirect_to users_url
  end
end
