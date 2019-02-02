# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview
  def user_info
    UserMailer.user_info(User.first)
  end
end
