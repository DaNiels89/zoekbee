# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :set_post, only: %i[show edit update destroy]

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
      redirect_back(failback_location: root_path)
      flash[:alert] = 'Post creation failed'
    end
  end

  def update
    if current_user == @post.user
      @post.update(post_params)
      redirect_to '/posts'
      flash[:notice] = 'Post is updated'
    else
      redirect_back(fallback_location: root_path)
      flash[:alert] = 'Not authorized to update post'
    end
  end

  def destroy
    post = Post.find(params[:id]).destroy
    if current_user == post.user
      post.destroy
      redirect_to '/posts'
      flash[:notice] = 'Post destroyed'
    else
      redirect_back(fallback_location: root_path)
      flash[:alert] = 'Not authorized to delete the post'
    end
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:pic, :title, :caption, :budget)
  end
end
