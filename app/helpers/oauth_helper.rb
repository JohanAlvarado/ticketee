module OauthHelper
  def auth_provider(name)
    link_to name,
    user_omniauth_authorize_path(name),
    :id => "sign_in_with_#{name}"
  end
end
