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

  def edit
    if current_user != @company.user_id
      redirect_to root_path
      flash[:alert] = 'Unauthorized request'
    end
  end

  def update
    if current_user == @company.user_id
      @company.update(company_params)
      redirect_to '/companies'
      flash[:notice] = 'Company is updated'
    else
      redirect_back(fallback_location: root_path)
      flash[:alert] = 'Not authorized to update company'
    end
  end

  def destroy
    @company.destroy
    if current_user == @company.user_id
      @company.destroy
      redirect_to '/companies'
      flash[:notice] = 'Company destroyed'
    else
      redirect_back(fallback_location: root_path)
      flash[:alert] = 'Not authorized to delete the company'
    end
  end

  private

  def set_company
    @company = Company.find(params[:id])
  end

  def post_params
    params.require(:company).permit(:pic, :name, :founder, :discription, :tag, :user_id, :price)
  end
end
