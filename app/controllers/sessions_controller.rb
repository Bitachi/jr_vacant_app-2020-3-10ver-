class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      #ユーザ情報のページにリダイレクトする
      log_in user
      redirect_to user
    else
      #エラーメッセージ
      flash.now[:danger] = "メールアドレスかパスワードが正しくありません"
      render "new"
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end
end
