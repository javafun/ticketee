class ProjectsController < ApplicationController
  def index

  end

  def show
    @project = Project.find(params[:id])
  end
  def new
    @project = Project.new
  end

  def create
    @project = Project.new(params[:project])
    if @project.save
      redirect_to @project, :notice => "Project has been created."
    else
      flash[:alert] = "Project has not been created."
      render :action => "new"
    #flash[:notice] = "Project has been created."
    #redirect_to @project
    #redirect_to project_path(@project)
    end
  end

end
