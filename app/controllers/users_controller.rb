class UsersController < ApplicationController
  before_action :set_user, only: %i[show]

  def index
    if params[:query].present?
      @users = User.global_search(params[:query])
    else
      @users = User.all
    end

    # if params[:query].present?
    #     @filter = params[:query]["skills"].reject(&:blank?)
    #     puts @filter
    #     @users = User.all.global_search("#{@filter}").tagged_with(@filter)
    #   else
    #     @users = User.all
    # end
  end

  def show
  end

  private

  def set_user
    @user = User.find(current_user.id)
  end
end
