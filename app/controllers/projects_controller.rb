class ProjectsController < ApplicationController

  before_action :find_project,
                only: [:edit, :destroy, :update]


  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
  end

  def create
    # COMMENTED OUT
    # project_attributes = params.require(:project).permit([:title, :description])
    @project = Project.new(project_attributes)

    ### @project = project.new(params[:project])
    ### ^^forbidden in Rails 4+ for security reasons

      # same as below ^^
      # @project.title = params[:project][:title]
      # @project.title = params[:project][:description]

    ####for a user creating a project
    # @project.user = current_user
    #Above replaces (do not use):
    #@project.user = current_user.projects.new(project_attributes)
    ####
     if  @project.save
      flash[:notice] = "Your project was created successfully!"
      redirect_to projects_path
    else
      flash.now[:error] = "Please correct the form"
      render :new
    end

  end

  def show
    @project = Project.find(params[:id])
  end

  def update
    if @project.update_attributes(project_attributes)
      redirect_to projects_path(@project.id), notice: "Projected Updated Successfully!"
    else 
      redirect_to projects_path(@project.id), alert: "We have a problem with updating your project."
    end
  end

  def destroy
    if @project.destroy
      redirect_to projects_path, notice: "Project Deleted Successfully"
    else redirect_to projects_path, alert: "We had trouble deleting your project."
    end
  end

private

  def find_project
  @project = Project.find params[:id]  
  end

  ##Method to define what's needed to create a new project
  def project_attributes
    project_attributes = params.require(:project).permit([:title, :description])
  end 


end
