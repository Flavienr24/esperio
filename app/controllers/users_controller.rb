class UsersController < ApplicationController
  def index
     @users = User.all
     @users = @users.fullname_search(params[:query]) if params[:query].present?
     @users = User.all.select { |user| user.skill_list.include?(params[:query]) } if @users.empty?
     @user = User.find(current_user.id)
  end

  def show
    @user = User.find(params[:id])
    @projects_I_lead = @user.projects
    @collaborations = @user.collaborations
    @myexpertises = @user.skill_list
  end

  def my_profile
    @user = current_user
    @user.avatar = src="flavien.png"
    @projects_I_lead = @user.projects.order("created_at DESC")
    @collaborations = @user.collaborations
    @myexpertises = @user.skill_list
  end
end
