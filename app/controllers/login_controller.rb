class LoginController < ApplicationController
  layout false
  skip_before_action :check_logined
  def index
#    session[:usr] = nil
#    session[:usrname] = nil
    reset_session
  end

  def auth
    usr = User.authenticate(params[:userid],params[:password])
    if usr then
      reset_session
      session[:usr] = usr.id
      session[:usrname] = usr.username
      redirect_to books_url
    else
      flash.now[:referer] = params[:referer]
      @error = 'ユーザーID/パスワードが間違っています。'
      render 'index'
    end
  end
#  def logout
#    reset_session
#  end

end
