class ReportMailer < ApplicationMailer
  def send_mail
    @report = params[:report]
    mail(
      to: 'report@example.com',
      subject: '報告通知'
    )
  end
end
