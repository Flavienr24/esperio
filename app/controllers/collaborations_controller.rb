class CollaborationsController < ApplicationController
  before_action :set_collaboration, only: %i[show edit destroy]

  def index
    @collaborations = Collaboration.all
  end

  def show
  end

  def new
    @collaboration = Collaboration.new
  end

  # A tester une fois les modules requis en front seront existant

  def create
    @project = Project.find(params[:project_id])
    @collaboration = Collaboration.new(collaboration_params)
    @collaboration.project = @project
    @collaboration.joined = 'Pending'
    if @collaboration.save
      redirect_to collaborations_path(@collaboration)
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
    params.require(:collaborations).permit(:name)
  end
end
