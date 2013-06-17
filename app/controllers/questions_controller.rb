class QuestionsController < ApplicationController

  def index
    @questions = Question.where(:user_id => params[:user_id]) 
    if @questions != nil
      @answers = []
      @questions.each do |q|
         @answers << q.answers.build
      end
    end
    if current_user.id == params[:user_id].to_i
      @magic = true
    end
  end

  def new
    @question = Question.new
  end

  def show
    @question = Question.find(params[:id])
    @answer = Answer.new 
    @answers = @question.answers
  end

  def create
    @question = Question.new(:text => params[:question][:text],
                              :user_id => current_user.id)
    if @question.save
      flash[:notice] = "Question successfully posted"
      redirect_to user_questions_path
    else
      flash[:error] = "Question fields not completed"
      redirect_to new_question_path
    end
  end

  def edit
    @question = Question.find(params[:id])
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    redirect_to :back
  end

end
