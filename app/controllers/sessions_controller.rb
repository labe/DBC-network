class SessionsController < ApplicationController
  def new

  end

  def show
    @user = current_user
  end


  def create
    @user = User.find_by_email(params[:email])
    if @user && @user.authenticate(params[:password])
      if @user.activated == true
        session[:user_id] = @user.id
        path = @user.find_homepage(@user.groupable_type)
        path_options = path[:options]
        path_direction = path[:path]
        redirect_to eval("#{path_direction}_path#{path_options}")
      elsif @user.activated == false
        flash.now.alert = "Sorry. Your account has been denied."
        render "new"
      elsif @user.activated == nil
        flash.now.alert = "Hold your horses, your account is pending approval."
        render "new"
      end
    else
      flash[:error] = "Your credentials were off. Give it another shot."
      redirect_to root_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/'
  end
end
