class SessionsController < ApplicationController
  def new
  end


  def create
    @user = User.find_by_email(params[:email])
    if @user && @user.authenticate(params[:password])
      if @user.activated == true
        session[:user_id] = @user.id
        if @user.groupable_type == "Cohort"
          redirect_to student_home_path, :notice => "Logged In!"
        elsif @user.groupable_type == "Company"
          redirect_to employer_home_path, :notice => "Logged In!"
        elsif @user.groupable_type == "Admin"
          redirect_to admin_path
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
    session[:user_id] = nil
    redirect_to log_in_path
  end
end
