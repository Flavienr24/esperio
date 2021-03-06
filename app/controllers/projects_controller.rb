class ProjectsController < ApplicationController
  before_action :set_project, only: %i[show edit destroy]

  def index
    @projects = Project.all.order("created_at DESC")
  end

  def show
    @datetime = Time.now
    @user = current_user
    @projects_I_lead = Project.where(user_id: @user.id)
    @post = Post.new
    @t_day = (((@datetime - @project.created_at) / 3600) / 24).to_i
    @t_min = Time.at(@datetime - @project.created_at).utc.strftime("%H:%M:%S")
  end

  def new
    @project = Project.new
  end

  # A tester une fois les modules requis en front seront existant

  def create
    @project = Project.new(project_params)
    @project.status = 'In Progress'
    @project.user = current_user
    @project.project_tags = params[:project][:project_tags] if params[:project][:project_tags].present?
    if @project.save
      redirect_to project_path(@project)
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    @project = Project.find(params[:id])
    @project.project_tags.concat(params[:project][:project_tags])
    @project.update(project_params)
    redirect_to project_path
  end

  # def destroy
  #   @project.destroy
  #   redirect_to projects_path
  # end

  private

  def set_project
    @project = Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:name, :description, :visibility)
  end
end
