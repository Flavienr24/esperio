class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit]

  def index
    @users = User.all
  end

  def show
    @user = current_user
    @myprojects = @user.projects
    @myexpertises = @user.expertises
    @mycollaboration = @user.collaborations

  end

  # def new
  #   @user = User.new
  # end

  # A tester une fois les modules requis en front seront existant

  # def create
  #   @user = User.new(user_params)
  #   if @user.save
  #     redirect_to user_path(@user)
  #   else
  #     render 'new'
  #   end
  # end

  def edit
  end

  def update
    @user.update(users_params)
    redirect_to user_path(@user)
  end

  private

  def set_user
    # @company = Company.find(params[:company_id])
    @user = current_user
  end

  def users_params
    params.require(:users).permit(:fullname, :phone, :country, :city, :function, :school)
  end
end
