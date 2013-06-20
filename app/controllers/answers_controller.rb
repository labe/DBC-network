class AnswersController < ApplicationController
  
  def new
    @question = Question.new
  end
  
  def create
    @answers = []
    @questions = []

    params[:answer].each do |options|
      question = Question.find(options[:question_id])
      answer = Answer.new(:user => current_user, :question => question, :text => options[:text])
      @answers << answer
      @questions << answer.question
    end

    if @answers.any?{|a| !a.valid? }
      flash[:error] = "Please answer every question."
      render 'questions/index'
    else
      @answers.each{ |a| a.save }
      @company = @answers.last.question.company
      @new_contact = CompanyContact.new(:user_id => current_user.id,
                            :company_id => @company.id)
      if @new_contact.save
        redirect_to companies_path, :flash => { :success => "Answers posted. Good luck!" }
        @response = @answers.zip(@questions)
        InterestMailer.delay.student_initiated_email(@company, current_user, @response)
      end
    end
   
  end

  def show
    @answer = Answer.find(params[:id])
  end

  def destroy
    @answer = Answer.find(params[:id])
    @answer.destroy
  end

end
