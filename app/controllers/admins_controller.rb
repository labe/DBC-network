class AdminsController < ApplicationController
  def activation
    user = User.find(params[:user][:id])
    user.activated = params[:user][:activated]
    user.save

    UserMailer.student_welcome_email(user).deliver if user.activated == true
    redirect_to :back
  end

  def deny
    user = User.find(params[:user][:id])
    user.activated = params[:user][:activated]
    user.save
    # Send out denied email to this user
    redirect_to :back
  end

  def index
    if current_user.groupable_type == "Admin"
      @users = User.all
      @students = User.where(:groupable_type => "Cohort")
      @active_students = User.where(:groupable_type => "Cohort", :status => "active")
      @employers = User.where(:groupable_type => "Company")
      @companies = Company.all
      @cohorts = Cohort.all
      @interests = Interest.all
      @questions = Question.all
      @answers = Answer.all
    else
      redirect_to root_path
    end
  end
end
