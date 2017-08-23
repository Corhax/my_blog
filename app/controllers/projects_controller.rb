class ProjectsController < ApplicationController
  before_action :find_project, only:[:show, :edit, :update, :destroy]
  def index
    @projects = Project.all.order("created_at DESC")
  end

  def show
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new (project_params)
    if @project.save
      redirect_to @project, notice:"Project was succsesfully created!"
    else
      render 'new', notice: "Somethign went wrong!"
    end
  end

  def edit
  end

  def update
    if @project.update(project_params)
      redirect_to @project, notice: "Project was succsesfully updated!"
    else
      render 'edit'
    end
  end

  def destroy
    @project.destroy
      redirect_to projects_path
  end

  private
    def project_params
      params.require(:project).permit(:title, :body, :link, :slug)
    end

    def find_project
      @project = Project.friendly.find(params[:id])
    end
end
