# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(post_params)
  end
end
