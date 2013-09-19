class Api::V1::ProjectsController < Api::BaseController
  before_filter :find_project, :only => [:show,:update,:destroy]

  def index
    respond_with(current_user.projects)
  end

  def show
    respond_with(@project, :methods => "last_ticket")
  end

  def create
    project = Project.new(params[:project])
    if project.save
      respond_with(project, :location => api_v1_project_path(project))
    else
      respond_with(project)
    end
  end

  def update
    @project.update_attributes(params[:project])
    respond_with(@project)
  end

  def destroy
    @project.destroy
    respond_with(@project)
  end

  private
  def find_project
    @project = Project.find(params[:id])
    rescue ActiveRecord::RecordNotFound
    error = { :error => "The project you were looking for " +
              "could not be found."}
    respond_with(error, :status => 404)
  end

end
