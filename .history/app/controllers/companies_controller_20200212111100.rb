# frozen_string_literal: true

class CompaniesController < ApplicationController
  def index
    @companies = Company.all
  end
end
