class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def require_signin!
    if current_user == nil
      session[:intended_destination] = request.fullpath
      flash[:alert] = "You need to sign in or sign up before continuing."
      redirect_to signin_url
    end
  end

  def current_user
    User.find_by_id!(session[:user_id]) if session[:user_id] != nil
  end
  
  private

  def authorize_admin!
    require_signin!
    unless current_user.admin?
      flash[:alert] = "You must be an admin to do that."
      redirect_to root_path
    end
  end


end
