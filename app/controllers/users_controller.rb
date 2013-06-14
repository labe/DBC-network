class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    p "HERE ARE THE PARAMS #{params}"
    @user = User.new(:first_name => params[:user][:first_name],
                     :last_name => params[:user][:last_name],
                     :email => params[:user][:email],
                     :password => params[:user][:password],
                     :account_type_id => params[:user][:account_type_id])
    if @user.save
      if params[:user][:company_id]
        employer = Employer.new(:user_id => @user.id,
                     :company_id => params[:user][:company_id])
        employer.save
      elsif params[:user][:cohort_id]
        student = Student.new(:user_id => @user.id,
                     :cohort_id => params[:user][:cohort_id])
        student.save
      end
      redirect_to thank_you_path, :notice => "Submitted! We'll get back to you soon."
    else
      flash.now.alert = "This email already exists."
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
