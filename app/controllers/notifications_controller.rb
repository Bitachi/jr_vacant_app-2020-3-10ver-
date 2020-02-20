class NotificationsController < ApplicationController

include SessionsHelper
  def new
    @notification = Notification.new()
  end

  def create
    @notification = Notification.new(notification_params)
    @current_user = current_user
    @notification.email = @current_user.email
    if @notification.save
      flash[:success] = "通知の登録に成功しました"
      redirect_to(root_path)
    else
      render "new"
    end
  end

  private
  def notification_params
      params.require(:notification).permit(:token, :month, :day, :train,
                                            :hour, :minute, :dep_stn, :arr_stn)

  end
end
