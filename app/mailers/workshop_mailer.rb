class WorkshopMailer < ApplicationMailer
  default from: 'cdevivencia@gmail.com'

  def workshop_info(workshop)
    @workshop = workshop
    @user = User.find(@workshop.author_id)
    attachments[@workshop.document.filename.to_s] = @workshop.document.download
    mail(to: @user.email, subject: 'Você enviou uma vivência para o Circuito de Vivências')
  end

  def workshop_status_update(workshop)
    @workshop = workshop
    @status = workshop.status
    @user = User.find(workshop.author_id)
    attachments[workshop.document.filename.to_s] = workshop.document.download
    if @status == 'accepted'
      mail(to: @user.email, subject: 'Sua Vivência foi aprovada!')
    elsif @status == 'rejected'
      mail(to: @user.email, subject: 'Sua Vivência precisa de ajustes!')
    end
  end
end
