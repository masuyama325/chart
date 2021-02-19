class SessionsController < ApplicationController
  # ログイン画面
  
  # application_controllerのメソッドにいく
  before_action :already_login?, except: :destroy
  
  def new
  end
  
  def create
    # byebug
    user = User.find_by(user_params)
    # ↓userが見つかってかつ、パスワードが正しければ
    if user && user.authenticate(password_params[:password])
      # privateのメソッドに飛ぶ↓
      log_in user
      # rails routesで確認、中身,users#show --> 
      redirect_to user_path, success: 'ログインに成功しました'
    else
      flash.now[:danger] = 'ログインに失敗しました'
      render :new
    end
  end
  
  def destroy
    # privateのメソッドに飛ぶ↓
    log_out
    redirect_to root_url, info: 'ログアウトしました'
  end
  
  private
  def log_in(user)
    # user.idをsessionの中に保存
    session[:user_id] = user.id
  end
  
  def log_out
    session.delete(:user_id)
    @current_user = nil
  end

  private
  def user_params
    params.require(:session).permit(:email)
  end
  
  def password_params
    params.require(:session).permit(:password)
  end
  
end
