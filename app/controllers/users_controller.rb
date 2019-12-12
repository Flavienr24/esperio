class UsersController < ApplicationController
  def index
    @users = User.all
    @users = @users.fullname_search(params[:query]) if params[:query].present?
    @users = User.all.tagged_with(params[:query], any: true) if @users.empty?
    @user = User.find(current_user.id)
  end

  def show
    @users_except_me = User.all_except(current_user)
    @user = User.find(params[:id])
    @projects_I_lead = @user.projects
    @collaborations = @user.collaborations
    @myexpertises = @user.skill_list
  end

  def my_profile
    @users_except_me = User.all_except(current_user)
    @user = current_user
    # @user.avatar = src="flavien.png"
    @projects_I_lead = @user.projects.order("created_at DESC")
    @collaborations = @user.collaborations
    @myexpertises = @user.skill_list
  end
end
