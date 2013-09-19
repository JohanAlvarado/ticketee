class CommentsController < ApplicationController
  before_filter :find_ticket

  def create
    @comment = @ticket.comments.build(comment_params)
    if @comment.save
      flash[:notice] = "Comment has been created."
      redirect_to [@ticket.project, @ticket] 
    else
      @states = State.all
      flash[:alert] = "Comment has not been created."
      render :template => "tickets/show" 
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text,:state_id)
  end

  def find_ticket
    @ticket = Ticket.find(params[:ticket_id])
  end

  def send_notification
    Notifier.user_created(User.find(current_user)).deliver
  end

end
