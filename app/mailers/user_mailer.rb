class UserMailer < ApplicationMailer
  default from: 'diptosarkarhridoy@gmail.com'

  def welcome_email
    @user = params[:user]
    @url  = 'https://members-only-ror.onrender.com/users/sign_in'
    mail(to: @user.email, subject: 'Welcome to Members only')
  end
end
