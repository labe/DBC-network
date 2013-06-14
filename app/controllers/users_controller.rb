class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      session[:user_id] = @user.id 
      redirect_to user_path(@user), :notice => "Signed Up!"
    else
      flash.now.alert = "Username and/or Email already Exist"
      render "new"
    end
  end

  def show
      @user = User.find(params[:id])
  end

  def edit
    @user = user.find(params[:id])
    end

    def update
      @user = User.Find(params[:id])
  end

    def destroy
      @user = User.Find(params[:id])
      @user.destroy
    end
end
