class UserMailer < ApplicationMailer
  default from: 'cdevivencia@gmail.com'

  def user_info(user)
    @user = user
    mail(to: @user.email, subject: 'Sua conta no Circuito de Vivências')
  end
end
