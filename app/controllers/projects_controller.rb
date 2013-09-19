class ProjectsController < ApplicationController
  before_action :authorize_admin!, except: [:index, :show]
  before_action :set_project, only: [:show, :edit, :update, :destroy]

  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    @project.user = current_user
    if @project.save
      flash[:notice] = "Project has been created."
      redirect_to @project
    else
      flash[:alert] = "Project has not been created."
      render :action => "new"
    end
  end

  def edit
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])
    if @project.update(project_params)
      flash[:notice] = "Project has been updated."
      redirect_to @project
    else
      flash[:alert] = "Project has not been updated."
      render action: "edit"
    end
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    flash[:notice] = "Project has been destroyed."
    redirect_to projects_path
  end

  def show
    @tickets = @project.tickets
    @tickets = @tickets.page(params[:page]).per(50)
  end

  def project_params
    params.require(:project).permit(:name, :description)
  end

  def set_project
    @project = Project.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    flash[:alert] = "The project you were looking" +
      " for could not be found."
    redirect_to projects_path
  end

  def authorize_admin!
    unless current_user.admin?
      flash[:alert] = "You must be an admin to do that."
      redirect_to root_path
    end
  end
end
