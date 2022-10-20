class ReportMailer < ApplicationMailer
  def send_mail
    @report = params[:report]
    mail(
      to: ENV['ADMIN_EMAIL_ADDRESS'],
      subject: '報告通知'
    )
  end
end
