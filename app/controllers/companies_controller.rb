class CompaniesController < ApplicationController
  before_action :set_company, only: %i[show edit]

  def index
    @companies = Company.all
  end

  def show
  end

  def new
    @company = Company.new
  end

  # A tester une fois les modules requis en front seront existant

  def create
    @company = Company.new(company_params)
    if @company.save
      redirect_to companies_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    @company.update(company_params)
    redirect_to company_path(@company)
  end

  private

  def set_company
    @company = Company.find(params[:id])
  end

  def company_params
    params.require(:companies).permit(:name)
  end
end
