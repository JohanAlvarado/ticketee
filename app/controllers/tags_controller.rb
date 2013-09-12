class TagsController < ApplicationController
  before_action :require_signin!, except: [:show, :index]

  def remove
    @ticket = Ticket.find(params[:ticket_id])
    if current_user.admin?
      @tag = Tag.find(params[:id])
      @ticket.tags -= [@tag]
      @ticket.save
      render :nothing => true
    end
  end

end
