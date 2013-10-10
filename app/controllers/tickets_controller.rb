class TicketsController < ApplicationController
  before_action :require_signin!, except: [:show, :index]
  before_action :set_project ,only: [:show, :edit, :update, :destroy]
  before_action :set_ticket, only: [:show, :edit, :update, :destroy]

  def new
    @ticket = @project.tickets.build
    3.times { @ticket.assets.build }
  end

  def show
    @comment = @ticket.comments.build
    @states = State.all
  end

  def create
    @ticket = @project.tickets.build(ticket_params)
    @ticket.user = current_user
    if @ticket.save
      flash[:notice] = "Ticket has been created."
      redirect_to [@project, @ticket]
    else
      flash[:alert] = "Ticket has not been created."
      render :action => "new"
    end
  end

  def search
    @tickets = @project.tickets.search("tag:#{params[:search]}")
    @project.tickets = @tickets.page(params[:page]).per(5)
    redirect_to [@project]
  end

  def download 
    url = Ticket.find(305).assets.first.asset.url 
    url_path = "#{Rails.root}/public#{url}"
    send_file url_path
  end


  private

  def ticket_params
    params.require(:ticket).permit(:title, :description,:tag_names,assets_attributes: [:asset])
  end

  def set_ticket
    @ticket = @project.tickets.find(params[:id])
  end

  def set_project
    @project = Project.find(params[:project_id])
  end

end
