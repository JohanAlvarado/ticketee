class Api::V2::TicketsController < Api::BaseController
  before_filter :find_project

  def index
    respond_with(@project.tickets.page(params[:page]))
  end

  private

  def find_project
    @project = Project.find(params[:project_id])
    rescue ActiveRecord::RecordNotFound
    error = { :error => "The project you were looking for" +
              " could not be found."}
    respond_with(error, :status => 404)
  end
end