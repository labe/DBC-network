class AdminsController < ApplicationController
    def activation
        user = User.find(params[:user][:student_id])
        user.activated = params[:user][:activated]
        user.save
        UserMailer.student_welcome_email(user).deliver if user.activated == true
        redirect_to :back
    end

    def index
    @students = User.where(:groupable_type => "Cohort")
    @active_students = User.where(:groupable_type => "Cohort", :status => "active")
    @employers = User.where(:groupable_type => "Company")
    @companies = Company.all
    @cohorts = Cohort.all
    @interests = Interest.all
    end
end