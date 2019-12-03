class ProjectsController < ApplicationController
  before_action :set_projects, only: %i[show edit]

  def index
    @projects = Project.all
  end

  def show
  end

  def new
    @project = Project.new
  end

  # A tester une fois les modules requis en front seront existant

  def create
    @project = Project.new(project_params)
    @project.status = 'In Progress'
    @project.user = current_user
    @project.visibility = false
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
    @project.update(project_params)
    redirect_to project_path
  end

  private

  def set_projects
    @projects = Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:name, :description)
  end
end
