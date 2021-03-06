class UsersController < ApplicationController

  def index
    if params[:student]
      @users = User.where(:groupable_type => "Cohort", :status => "active").order("last_name")
      @groupable = "Students"
    elsif params[:company]
      @users = User.where(:groupable_type => "Company").order("last_name")
      @groupable = "Employers"
    elsif params[:alumni]
      @users = User.where(:groupable_type => "Cohort").order("last_name")
      @groupable = "Alumni"
    elsif params[:mentor]
      @users = User.where(:groupable_type => "Mentorship").order("last_name")
      @groupable = "Mentors"
    elsif params[:staff]
      @users = User.where(:groupable_type => "Faculty").order("last_name")
      @groupable = "Staff"
    elsif current_user.groupable_type == "Cohort"
      @users = User.where(:groupable_type => "Company").order("last_name")
      @groupable = "Students"
    elsif current_user.groupable_type == "Company"
      @users = User.where(:groupable_type => "Cohort").order("last_name")
      @groupable = "Employers"
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
    @current_top_5 = @user.git_hub_selections
    if @user.groupable_type == "Cohort" && @user.github_handle
      github = Github.new(@user)
      @repos = github.zip_repo_url_names
    else
      @repos = []
    end
    @pitcher_interest = Interest.find_by_pitcher_id_and_catcher_id(current_user.id, @user.id)
    @catcher_interest = Interest.find_by_pitcher_id_and_catcher_id(@user.id, current_user.id)
  end

  def edit
    @user = User.find(params[:id])
    if current_user.id != @user.id
      redirect_to users_path
    end
    if @user.groupable_type == "Cohort" && @user.github_handle
      @current_top_5 = @user.git_hub_selections
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
    @user.git_hub_selections.each {|selections| selections.destroy }
    params[:selected].each do |repo|
      selection = GitHubSelection.create(:name => repo[1]['name'], :url => repo[1]['url'])
      @user.git_hub_selections << selection
     @user.save
   end
  end

  def connect_students
    @interest = Interest.create(params[:interest])
    @catcher = User.find(@interest.catcher_id)
    @pitcher = User.find(@interest.pitcher_id)
    if current_user.groupable_type == "Company"
      InterestMailer.employer_initiated_email(@catcher, @pitcher).deliver
      @interest.email_sent_on = DateTime.now
      @interest.save
    else
      InterestMailer.s2s_pending_connection(@catcher, @pitcher).deliver
      @interest.email_sent_on = DateTime.now
      @interest.save
    end
    redirect_to :back
  end

  def connect_employers
    @user_id = current_user.id
    @company_id = params[:company_contact][:company_id]
    redirect_to company_questions_path(@company_id)
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
