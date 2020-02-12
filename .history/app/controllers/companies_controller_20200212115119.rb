# frozen_string_literal: true

class CompaniesController < ApplicationController
  before_action :set_company, only: %i[show edit update destroy]
  def index
    @companies = Company.all
  end

  def show; end

  def new
    @company = Company.new
  end

  def edit
    if current_user != @company.user_id
      redirect_to root_path
      flash[:alert] = 'Unauthorized request'
    end
  end

  def create
    @company = Company.new(company_params)
    @company.user_id = current_user.id
    if @company.save
      redirect_to @company
      flash[:notice] = 'Company created!'
    else
      redirect_back(failback_location: root_path)
      flash[:alert] = 'Company creation failed'
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
    @post.destroy
    if current_user == @post.user
      @post.destroy
      redirect_to '/posts'
      # for removing on the user page
      # redirect_back(fallback_location: user_path)
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
