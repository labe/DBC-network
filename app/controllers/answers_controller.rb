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
      # Saving @questions here is kinda confusing, since we don't use @questions until
      # attempting to send an email. I'd pull this out and move all the email related work
      # to a helper method. See me so we can refactor this together
      @questions << answer.question
    end

    if @answers.any?{|a| !a.valid? }
      render "questions/index", :flash => { :error => "Answer invalid" }
    else
      @answers.each{ |a| a.save }
      redirect_to users_path, :flash => { :success => "Answer Posted" }
    end

    # When do you execute this code? Consider when the user has submitted invalid questions
    @catcher = @answers.last.question.user_id
    @responses = @answers.zip(@questions)
    InterestMailer.delay.student_initiated_email(@catcher, current_user, @responses)
  end

  def show
    @answer = Answer.find(params[:id])
  end

  def destroy
    @answer = Answer.find(params[:id])
    @answer.destroy
  end

end
