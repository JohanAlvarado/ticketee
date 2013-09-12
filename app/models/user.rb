class User < ActiveRecord::Base

  has_secure_password
  after_save :send_notification

  def send_notification
    Notifier.user_created(self).deliver
  end

end
