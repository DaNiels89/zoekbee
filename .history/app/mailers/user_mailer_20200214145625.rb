# frozen_string_literal: true

class UserMailer < ApplicationMailer
  default from: 'notifications@example.com'

  def welcome_email
    @user = User.last
    mail(to: @user.email, subject: 'Welcome to ZoekBee')
  end

  def new_post_email(email, post)
    @post = post
    mail(to: email, subject: 'This is a ZoekBee')
  end
end
