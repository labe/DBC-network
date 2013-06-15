class UsersController < ApplicationController

  def new
    @user = User.new
  end
  
  def create
    @user = User.new(:first_name => params[:user][:first_name],
                     :last_name => params[:user][:last_name],
                     :email => params[:user][:email],
                     :password => params[:user][:password],
                     :groupable_type => params[:user][:groupable_type],
                     :groupable_id => params[:user][:groupable_id])
    if @user.save
      UserMailer.pending_email(@user).deliver
      redirect_to thank_you_path, :notice => "Submitted! We'll get back to you soon."
    else
      flash.now.alert = "This email already exists."
      render "new"
    end
  end

  def show
    @user = User.find(params[:id])
    github = Github.new(@user)
    @repos = github.zip_repo_url_names
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
  end

  def status
    @user = User.find(params[:user][:id])
    @user.status = params[:user][:status]
    @user.save
    redirect_to :back
  end

  private
  def find_votable
    params.each do |name, value|
      if name =~ /(.+)_id$/
        return $1.classify.constantize.find(value)
      end
    end
    nil
  end
end
