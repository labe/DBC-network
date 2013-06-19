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
      render "questions/index", :flash => { :error => "Answer invalid" }
    else
      @answers.each{ |a| a.save }
      redirect_to users_path, :flash => { :success => "Answer Posted" }
    end
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
