class ProjectsController < ApplicationController
  before_action :find_project, only:[:show]
  def index
    @projects = Project.all.order("created_at DESC")
  end

  def show
  end

  private
    def find_project
      @project = Project.friendly.find(params[:id])
    end
end
