class UsersController < ApplicationController
  
  def show
    @user = User.find(params[:id]) # データベースから探す
  end
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      # 保存の成功をここで扱う
      log_in @user
      flash[:success] = "古田航輔のアプリへようこそ！"
      redirect_to user_url(@user)
    else
      render 'new'
    end
  end
# debugger トラブルが起こったコードの近くに差し込むのがコツ エラー追跡

  private

    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end
end
