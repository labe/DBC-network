class SessionsController < ApplicationController
  def new
  end

  def show
    @user = current_user
  end


  def create
    @user = User.find_by_email(params[:email])
    if @user && @user.authenticate(params[:password])
      # No need for "== true"
      if @user.activated == true
        session[:user_id] = @user.id

        # This is a lengthy set of if/else statements. Can you extract this
        # to a method?
        if @user.groupable_type == "Cohort"
          redirect_to users_path, :notice => "Logged In!"
        elsif @user.groupable_type == "Company"
          redirect_to users_path, :notice => "Logged In!"
          @users = User.where(:groupable_type => "Company")
        elsif @user.groupable_type == "Admin"
          redirect_to admins_path
        end
      elsif @user.activated == false
        flash.now.alert = "Sorry. Your account has been denied."
        render "new"
      elsif @user.activated == nil
        flash.now.alert = "Hold your horses, your account is pending approval."
        render "new"
      end
    else
      flash.now.alert = "Invalid email or password"
      render "new"
    end
  end

  def destroy
    # 'reset_session' is a more thorough way to log someone out
    session[:user_id] = nil
    redirect_to log_in_path
  end
end
