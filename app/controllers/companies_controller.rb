class CompaniesController < ApplicationController
  before_action :set_companies, only: %i[show edit]

  def index
    @companies = User.all
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
      redirect_to company_path(@company)
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    @project.update(project_params)
    redirect_to dashboard_path
  end

  private

  def set_companies
    @company = Company.find(params[:id])
  end

  def project_params
    params.require(:companies).permit(:name)
  end
end
