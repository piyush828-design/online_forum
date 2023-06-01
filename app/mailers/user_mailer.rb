class UserMailer < ApplicationMailer
	
  def welcome_mail(user)
    @user = user
    mail(to: user.email, subject: 'Welcome to online forum')
  end

  def approve_mail(topic)
  	@topic = topic
  	mail(to: @topic,subject:'Your post has been approved')
  end

  def disapprove_mail(topic)
    @topic = topic
    mail(to: @topic,subject: 'Your post has been disapproved')
  end
end

UserMailer.welcome_mail(User.last)
