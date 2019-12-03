class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit]

  def index
    @users = User.all
  end

  def show
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
    @project.update(users_params)
    redirect_to dashboard_path
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def users_params
    params.require(:users).permit(:first_name, :last_name, :phone, :country, :city, :function, :school)
  end
end
