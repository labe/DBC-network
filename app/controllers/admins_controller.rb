class AdminsController < ApplicationController
  def user_activation
    user = User.find(params[:user][:id])
    user.activated = params[:user][:activated]
    user.save

    UserMailer.delay.student_welcome_email(user) if user.activated == true
    redirect_to :back
  end

  def user_deny
    user = User.find(params[:user][:id])
    user.activated = params[:user][:activated]
    user.save
    # Send out denied email to this user
    redirect_to :back
  end

  def company_activation
    company = Company.find(params[:company][:id])
    company.activated = params[:company][:activated]
    company.save

    # UserMailer.delay.student_welcome_email(user) if company.activated == true
    redirect_to :back
  end

  def company_deny
    company = Company.find(params[:company][:id])
    company.activated = params[:company][:activated]
    company.save
    # Send out denied email to this user
    redirect_to :back
  end

  def index
    if current_user.groupable_type == "Administration"
      @users = User.all
      @students = User.where(:groupable_type => "Cohort")
      @active_students = User.where(:groupable_type => "Cohort", :status => "active")
      @employers = User.where(:groupable_type => "Company")
      @companies = Company.all
      @cohorts = Cohort.all
      @interests = Interest.all
      @questions = Question.all
      @answers = Answer.all
      @company_contacts = CompanyContact.all
    else
      redirect_to root_path
    end
  end

  def create_users
  end

  def create_student
    @user = User.new(:activated => true,
                     :first_name => params[:user][:first_name],
                     :last_name => params[:user][:last_name],
                     :email => params[:user][:email],
                     :password => params[:user][:password],
                     :groupable_id => params[:user][:groupable_id],
                     :groupable_type => "Cohort",
                     :facebook_url => params[:user][:facebook_url],
                     :github_handle => params[:user][:github_handle],
                     :graduation_date => params[:user][:graduation_date],
                     :intro => params[:user][:intro],
                     :linkedin_url => params[:user][:intro],
                     :location => params[:user][:location],
                     :phone => params[:user][:phone],
                     :status => "active",
                     :tumblr_url => params[:user][:tumblr_url],
                     :twitter_url => params[:user][:twitter_url]
                     )
    if @user.save
      flash[:success] = "Alumni profile created!"
    else
      flash[:error] = "Student was not saved correctly. Please try again."
    end
    redirect_to thank_you_path
  end

  def create_employer
    @user = User.new(:activated => true,
                     :first_name => params[:user][:first_name],
                     :last_name => params[:user][:last_name],
                     :email => params[:user][:email],
                     :password => params[:user][:password],
                     :groupable_id => params[:user][:groupable_id],
                     :groupable_type => "Company",
                     :location => params[:user][:location],
                     :password => params[:user][:password],
                     :phone => params[:user][:phone],
                     :status => "active",
                     )
    if @user.save
      flash[:success] = "Employer created successfully!"
    else
      flash[:error] = "Employer was not saved correctly. Please try again."
    end
    redirect_to :back
  end

  def create_company
    @company = Company.new(:website => params[:company][:website],
                           :name => params[:company][:name],
                           :location => params[:company][:location],
                           :status => "active",
                           :initial_email_contact => params[:company][:initial_email_contact])
    if @company.save
      flash[:success] = "Company created successfully!"
    else
      flash[:error] = "Company was not saved correctly. Please try again."
    end
    redirect_to :back
  end

  def create_cohort
    @cohort = Cohort.new(:name => params[:cohort][:name])
    if @cohort.save
      flash[:success] = "Cohort created successfully!"
    else
      flash[:error] = "Cohort was not saved correctly. Please try again."
    end
    redirect_to :back
  end

end
