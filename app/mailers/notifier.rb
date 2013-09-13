class Notifier < ActionMailer::Base

  default from: "johan.alvaradohdz@gmail.com from_address"

  def user_created(user)
    @user = user
    subject = "[ticketee]"
    mail(:to => user.email, :subject => subject)
  end

end
