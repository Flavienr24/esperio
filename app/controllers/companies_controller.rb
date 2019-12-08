class CompaniesController < ApplicationController
  before_action :set_company, only: %i[show edit]

  def index
    @companies = Company.all
  end

  def show
    @expertises_hash = Hash.new
    @users = User.all
    @users.each do |user|
      puts user.fullname
      user.skills.each do |skill|
        if @expertises_hash.key?(skill.name)
          @expertises_hash[skill.name] += 1
        else
          @expertises_hash[skill.name] = 1
        end
      end
    end
   @expertises_hash = @expertises_hash.sort_by { |skill, number| number }.reverse.to_h
  gon.expertises_hash = @expertises_hash
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
