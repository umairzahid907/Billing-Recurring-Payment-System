# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit destroy]

  def index
    @user = User.all
  end

  def show; end

  def edit; end

  def destroy
    if @user.destroy
      redirect_to users_url, notice: 'User was successfully destroyed.'
    else
      flash[:alert] = 'Could not delete thie user.'
      redirect_to users_url
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
