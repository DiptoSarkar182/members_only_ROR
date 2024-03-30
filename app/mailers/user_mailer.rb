class UserMailer < ApplicationMailer
  default from: 'members-only@supports.com'

  def welcome_email
    @user = params[:user]
    @url  = 'http://127.0.0.1:3000/users/sign_in'
    mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  end
end
