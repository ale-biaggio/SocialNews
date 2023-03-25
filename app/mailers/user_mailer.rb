class UserMailer < ApplicationMailer
  def report_email(user_report)
    @user_report = user_report
    mail(to: 'socialnews@gmail.com', from: @user_report.email, subject: 'Nuova segnalazione utente')
  end
end
