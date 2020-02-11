# frozen_string_literal: true

class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    if current_user.id != @user.id
      redirect_to root_path
      flash[:alert] = 'Unauthorized request'
    end
  end

  def create
    UserMailer.with(user: @user).welcome_email
  end
end
