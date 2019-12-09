class CollaborationsController < ApplicationController
  before_action :set_collaboration, only: %i[show edit destroy]

  def index
    @collaborations = Collaboration.all
  end

  def show
  end

  def new
    @collaboration = Collaboration.new
    @project = Project.find(params[:project_id])

  end

  def create
    @project = Project.find(params[:project_id])
    @collaboration = Collaboration.new(collaboration_params)
    @collaboration.joined = 'Pending'
    if @collaboration.save
      redirect_to project_path(@project)
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    @collaboration.update(joined: true)
    redirect_to project_path
  end

  def destroy
    @collaboration.destroy
    redirect_to collaborations_path
  end

  private

  def set_collaboration
    @collaboration = Collaboration.find(params[:id])
  end

  def collaboration_params
    params.require(:collaborations).permit(:project_id, :user, :joined)
  end
end
