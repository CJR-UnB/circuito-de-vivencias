class UserMailer < ApplicationMailer
  default from: 'cdevivencia@gmail.com'

  def user_info(user)
    @user = user
    if (@user.email !=  'supervisor@email.com' && @user.email != 'admin@email.com')
      mail(to: @user.email, subject: 'Sua conta no Circuito de Vivências')
    end
  end
end
