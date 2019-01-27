# Preview all emails at http://localhost:3000/rails/mailers/workshop_mailer
class WorkshopMailerPreview < ActionMailer::Preview
  def workshop_info
    WorkshopMailer.workshop_info(Workshop.first)
  end
end
