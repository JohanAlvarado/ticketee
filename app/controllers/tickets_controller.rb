class TicketsController < ApplicationController
  before_action :set_project
  before_action :set_ticket, only: [:show, :edit, :update, :destroy]
  def new
    @ticket = @project.tickets.build
    3.times { @ticket.assets.build }
  end

  def show
    @comment = @ticket.comments.build
  end

  def create
    @ticket = @project.tickets.build(ticket_params)
    if @ticket.save
      flash[:notice] = "Ticket has been created."
      redirect_to [@project, @ticket]
    else
      flash[:alert] = "Ticket has not been created."
      render :action => "new"
    end
  end

  private

  def ticket_params
    params.require(:ticket).permit(:title, :description,assets_attributes: [:asset])
  end

  def set_ticket
    @ticket = @project.tickets.find(params[:id])
  end

  def set_project
    @project = Project.find(params[:project_id])
  end

end
