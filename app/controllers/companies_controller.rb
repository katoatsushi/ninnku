class CompaniesController < ApplicationController
  def show
  	@company = Company.find(1)
  end

  def index
  end

  def edit
  end

  def update
  end
end
