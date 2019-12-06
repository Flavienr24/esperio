class ProjectsController < ApplicationController
  before_action :set_project, only: %i[show edit destroy]

  def index
    @projects = Project.all
  end


  def show
    @user = current_user
    @projects_I_lead = @user.projects

  end

  def new
    @project = Project.new
  end

  # A tester une fois les modules requis en front seront existant

  def create
    @project = Project.new(project_params)
    @project.status = 'In Progress'
    @project.user = current_user
    @project.visibility = true
    @project.open_to_apply = false
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
    params.require(:project).permit(:name, :description, :status, :visibility, :open_to_apply)
  end
end
