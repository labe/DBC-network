class UsersController < ApplicationController

  def index
    if current_user.groupable_type == "Cohort"
      @users = User.where("location IS NOT NULL")
      @groupable = "Student"
    elsif current_user.groupable_type == "Company"
      @users = User.where(:groupable_type => "Cohort")
      @groupable = "Employer"
    else
      @users = User.all
    end     
  end
  
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
    @interest = Interest.new
    @user = User.find(params[:id])
    # if @user.groupable_type == "Cohort" && @user.github_handle
    #   github = Github.new(@user)
    #   @repos = github.zip_repo_url_names
    # else
    #   @repos = []
    # end
  end

  def edit
    @user = User.find(params[:id])
    if current_user.id != @user.id 
      redirect_to users_path
    end
    if @user.groupable_type == "Cohort" && @user.github_handle
      github = Github.new(@user)
      @repos = github.zip_repo_url_names
      p @repos
    else
      @repos = []
    end
  end

  def update
    params[:user].delete(:password_confirmation)
    @user = User.find(params[:id])
    @user.update_attributes(params[:user])
    redirect_to :back
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

  def git_list
    p params
    @user = User.find(params[:user_id])
    params[:selected].each do |repo|
      selection = GitHubSelection.create(:name => repo)
    p @user.git_hub_selections << selection
    p @user.save
   end
    @user.git_selections
  end
  
  def connect_students
    @interest = Interest.create(params[:interest])
    @catcher = User.find(@interest.catcher_id)
    @pitcher = User.find(@interest.pitcher_id)
    if current_user.groupable_type == "Company"
      InterestMailer.employer_initiated_email(@catcher, @pitcher).deliver
    else
      InterestMailer.s2s_pending_connection(@catcher, @pitcher).deliver
    end
    redirect_to :back
  end

  def connect_employers
    @interest = Interest.create(params[:interest])
    @catcher = User.find(@interest.catcher_id)
    @pitcher = User.find(@interest.pitcher_id)
    InterestMailer.student_initiated_email(@catcher, @pitcher).deliver
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
