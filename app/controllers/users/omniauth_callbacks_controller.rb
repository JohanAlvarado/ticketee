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
      flash[:notice] = "Signed in with GitHub successfully."
      sign_in_and_redirect @user, :event => :authentication
    end

  end
end


