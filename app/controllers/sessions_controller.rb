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
        if @user.groupable_type == "Cohort"
          redirect_to companies_path, :notice => "Logged In!"
        elsif @user.groupable_type == "Company"
          redirect_to users_path(:student => "student"), :notice => "Logged In!"
          @users = User.where(:groupable_type => "Company")
        elsif @user.groupable_type == "Administration"
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
      flash[:error] = "Your credentials were off. Give it another shot."
      redirect_to root_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/'
  end
end
