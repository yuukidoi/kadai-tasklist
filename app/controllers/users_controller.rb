class UsersController < ApplicationController
  
  before_action :require_user_logged_in, only: [:index, :show]
  
  
  def index
    @users = User.order(id: :desc).page(params[:page]).per(25)
  end

  def show
    @user = current_user
  end


  def new
    @user =User.new
  end

  def create
    @user = User.new(user_params)
    
    if @user.save
      flash[:success] ='登録完了'
      redirect_to root_url
    else
      flash[:danger] = '失敗！'
      render :new
    end 
    
  end
  
  
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end 
  
end
