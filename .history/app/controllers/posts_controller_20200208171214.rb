# frozen_string_literal: true

class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def edit
    @post = Post.find(params[:id])
    if current_user != @post.user
      redirect_to root_path
      flash[:alert] = 'Unauthorized request'
    end
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to @post
      flash[:notice] = 'Post created!'
    else
      redirect_back(fallback_location: root_path)
      flash[:alert] = 'Post creation failed!'
    end

    redirect_to @post
  end

  private

  def post_params
    params.require(:post).permit(:title, :caption)
  end
end
