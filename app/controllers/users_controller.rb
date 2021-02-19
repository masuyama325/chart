class UsersController < ApplicationController
  
  # 新規登録画面
  
  # application_controllerのメソッドにいく
  before_action :already_login?, only: [:new, :create]
  before_action :logged_in?, only: :show
  
  # routeで書いたcontrollerのアクション↓
  def new
    # 空のモデルをformに(viewで書いた@user)渡すことができる
    @user = User.new
  end

  def create
    user = User.new(user_params)
    # userが保存されたら↓
    if user.save
      # user.idをsessionの中に保存
      session[:user_id] = user.id
      # どこに飛ばしたい,rails routesで確認、users#show 
      redirect_to user_path, success: '登録が完了しました'
    else
      flash.now[:danger] = "登録に失敗しました"
      render :new
    end
  end
  
  def show
  #配列形式でデータを用意する
      @data = [["2019-06-01", 100], ["2019-06-02", 200]]
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
  
  
  
end
