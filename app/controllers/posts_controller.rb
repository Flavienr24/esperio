class PostsController < ApplicationController

  def new
    @project = Project.find(params[:project_id])
    @post = Post.new
  end

  def create
    @project = Project.find(params[:project_id])
    @post = Post.new(post_params)
    @post.project = @project
    if @post.save
      redirect_to project_path(@project)
      # respond_to do |format|
      #   format.html { redirect_to project_path(@project) }
      #   format.js
      # end
    else
      render 'projects/show'
      # respond_to do |format|
      #   format.html { render 'projects/show' }
      #   format.js
      # end
    end
  end

    def destroy
      @post = Post.find(params[:id])
      @post.destroy
      redirect_to project_path(@dose.project)
    end

  private

  def post_params
    params.require(:post).permit(:content, :file)
  end
end
