class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  add_flash_types :success, :info, :warning, :danger
  
  # helper_method とかくとviewでもcurrent_userが使えるようになる
  helper_method :current_user
  
  # 以下を避けるためにアクセス制限を実装
  # ログインしてるのにログイン、新規登録いける
  # ログインしてない、新規登録してないのに中身いける
  
  def current_user
    if session[:user_id]
    # ||=とは、sessionのuser_idがnilではなかったら右側の値(sessionのuser_idでユーザを見つけ)current_userに入れる
      @current_user ||= User.find_by(id: session[:user_id])
    end
  end
  
  # users_controllerからapplication_controllerのメソッドにいく
  def logged_in?
    # current_userがnilだったらログインされてない、ログイン画面にとぶ
    if current_user.nil?
      redirect_to login_path, alert: "loginしてください"
    end
  end
  
  def already_login?
    # current_userがnilではなかったらuser_idが存在する、ログインしていたら中身に飛ぶ
    unless current_user.nil?
      redirect_to user_path, notice: "すでにloginしています"
    end
  end
  
end
