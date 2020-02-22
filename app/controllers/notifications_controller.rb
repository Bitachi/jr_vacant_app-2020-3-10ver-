class NotificationsController < ApplicationController
#include Encryptor
include SessionsHelper
require "#{Rails.root}/app/models/notification.rb"
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

  def index
    @current_user = current_user
    @notifcations = Notification.where(email: @current_user.email)
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
