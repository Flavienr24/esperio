class UsersController < ApplicationController
  before_action :set_user, only: %i[show]

  def index

    # if params[:query].present?
    #   @users = User.global_search_by_fullname_and_skills(params[:query])
    # else
    #   @users = User.all
    # end

    if params[:query]
      @filter = params[:query]["skill_list"]
      puts @filter
      @users = User.all.global_search_by_fullname_and_skills("#{@filter}").tagged_with(@filter)
    else
      @users = User.all
    end

    @users = User.all
    @user = current_user
    @collaborations = @user.collaborations
  end

  def show
    @user = current_user
    @projects_I_lead = @user.projects
    @collaborations = @user.collaborations
    # @myexpertises = @user.expertises
  end

  private

  def set_user
    @user = User.find(current_user.id)
  end
end
