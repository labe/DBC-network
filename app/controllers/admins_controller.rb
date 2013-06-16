class AdminsController < ApplicationController
  # #activation and #deny are both non-standard actions
  # I'd suggest creating routes that better describe these two concepts
  # For example, a 'ActivationsController' could use it's #create and #destroy
  # actions to perform the work of activating or denying a user.
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

  # This action feels like it should be called #dashboard. Creating an
  # app/controllers/admin/dashboard_controller.rb and moving this action
  # to the #show action is a better home for this.
  def index
    # Checking if current_user is an admin, should be done with a before_filter for all admin related actions
    if current_user.groupable_type == "Admin"
      # Fine for now, but be careful of these loading all the things. Once you get a number of users
      # you're going to need pagination or risk overlaoding your server
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
