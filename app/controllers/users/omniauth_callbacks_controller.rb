module Users
  class OmniauthCallbacksController < Devise::OmniauthCallbacksController

    def twitter
      @user = User.find_or_create_for_twitter(env["omniauth.auth"])
      session[:user_id] = @user.id
      flash[:notice] = "Signed in successfully."
      redirect_to root_url
    end

    def github
      @user = User.find_or_create_for_github(env["omniauth.auth"])
      session[:user_id] = @user.id
      flash[:notice] = "Signed in successfully."
      redirect_to root_url
    end

  end
end


