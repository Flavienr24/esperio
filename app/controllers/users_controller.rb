class UsersController < ApplicationController
  before_action :set_user, only: %i[show]

  def index

    if params[:query].present?
      @users = User.global_search_by_fullname_and_skills(params[:query])
    else
      @users = User.all
    end

    # if params[:query]
    #   @filter = params[:query]["skill_list"]
    #   puts @filter
    #   @users = User.all.global_search_by_fullname_and_skills("#{@filter}").tagged_with(@filter)
    # else
    #   @users = User.all
    # end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to user_path(@user)
    else
      render 'new'
    end
  end

    @user = User.find(current_user.id)
    @collaborations = @user.collaborations
  end

  def show
    @projects_I_lead = @user.projects
    @collaborations = @user.collaborations
    @myexpertises = @user.skill_list.each do |skill|
                        skill
                      end
  end

  private

  def set_user
    @user = User.find(current_user.id)

    # @user = User.find(current_user.id)
  end
end
