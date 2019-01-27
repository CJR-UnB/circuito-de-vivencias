class WorkshopMailer < ApplicationMailer
  default from: 'cdevivencia@gmail.com'

  def workshop_info(workshop)
    @workshop = workshop
    @user = User.find(@workshop.author_id)
    attachments[@workshop.document.filename.to_s] = @workshop.document.download
    mail(to: @user.email, subject: 'Você enviou uma oficina para o Circuito de Vivências')
  end
end
