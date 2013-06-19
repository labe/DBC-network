class QuestionsController < ApplicationController

  def index
    @questions = Question.where(:user_id => params[:user_id])
    # @questions will never be nil. At 'worst' it will be an empty array. Try it out in your console 
    if @questions != nil
      @answers = []
      @questions.each do |q|
         @answers << q.answers.build
      end
    end
    if current_user.id == params[:user_id].to_i
      @logged_in = true
    end
  end

  def new
    @question = Question.new
  end

  def show
    @question = Question.find(params[:id])
    @answer = Answer.new 
    # why the extra @answers ivar? You can just as easily access @question.answers in your view
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

  def update
    @question = Question.find(params[:id])
    @question.status = "inactive"
    @question.save
    redirect_to :back
  end

end
