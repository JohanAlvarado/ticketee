module ApplicationHelper

  def title(*parts)
    unless parts.empty?
      content_for :title do
        (parts << "Ticketee").join(" - ")
      end
    end
  end

  def current_user
    User.find_by_id!(session[:user_id]) if session[:user_id] != nil
    rescue ActiveRecord::RecordNotFound
  end

  def admins_only(&block)
    block.call if current_user.try(:admin?)
  end

  def resource_class
    devise_mapping.to
  end

end
