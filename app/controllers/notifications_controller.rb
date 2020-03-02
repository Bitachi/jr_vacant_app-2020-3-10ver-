class NotificationsController < ApplicationController
  include SessionsHelper
  require "#{Rails.root}/app/models/notification.rb"

  def new
    @notification = Notification.new()
  end

  def index
    @current_user = current_user
    @notifcations = Notification.where(email: @current_user.email)
  end
  
  def create
    @notification = Notification.new(notification_params)
    @current_user = current_user
    @notification.email = @current_user.email
    if @notification.save && system("python3 form_valid?.py #{@notification.month} #{@notification.day} #{@notification.hour} #{@notification.minute} #{@notification.train} #{@notification.dep_stn} #{@notification.arr_stn}")
      flash[:success] = "通知の登録に成功しました"
      redirect_to(root_path)
    else
      flash[:danger] = "入力内容が不正です。"
      redirect_to notifications_path
    end
  end

  def show
    @notification = Notification.find_by(id: params[:id])
  end

  def destroy
    Notification.find_by(id: params[:id]).destroy
    flash[:success] = "通知設定を消去しました"
    redirect_to notifications_index_path
  end

  private
  def notification_params
      params.require(:notification).permit(:token, :month, :day, :train,
                                            :hour, :minute, :dep_stn, :arr_stn)

  end
end
