class PostsController < ApplicationController

  def create
    @project = Project.find(params[:project_id])
    @post = Post.new(post_params)
    @post.project = @project
    if @post.save
      redirect_to project_path(@project)
    else
      render 'projects/show'
    end
  end

  private
  def post_params
    params.require(:post).permit(:content, :file)
  end
end
