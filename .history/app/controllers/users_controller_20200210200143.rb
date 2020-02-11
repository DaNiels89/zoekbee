# frozen_string_literal: true

class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    end
  end

  def create
    UserMailer.with(user: @user).welcome_email
  end
end
