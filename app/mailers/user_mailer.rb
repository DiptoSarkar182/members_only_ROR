class UserMailer < ApplicationMailer
  default from: 'diptosarkarhridoy@gmail.com'

  def welcome_email
    @user = params[:user]
    @url  = 'https://members-only-ror.onrender.com/'
    mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  end
end
