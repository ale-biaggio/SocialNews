class UserReportsController < ApplicationController

  def new
    @user_report = UserReport.new
  end

  def create
    @user_report = UserReport.new(user_report_params)

    if @user_report.save
      # Invia l'email utilizzando il metodo mail della classe UserMailer
      UserMailer.report_email(@user_report).deliver_now

      redirect_to root_path, notice: 'La tua segnalazione è stata inviata con successo.'
    else
      render :new
    end
  end

  private

  def user_report_params
    params.require(:user_report).permit(:topic, :email, :message)
  end
end
