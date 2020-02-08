# frozen_string_literal: true

class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show; end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)

    redirect_to @post
  end

  private

  def post_params
    params.require(:post).permit(:title, :caption)
  end
end
