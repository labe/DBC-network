class QuestionsController < ApplicationController

  def index
    @questions = Question.where(:company_id => params[:company_id]) 
    if @questions != nil
      @answers = []
      @questions.each do |q|
         @answers << q.answers.build
      end
    end
    if current_user.groupable.name == Company.find(params[:company_id]).name
      @works_at_company = true
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
                             :company_id => current_user.groupable_id,
                             :user_id => current_user.id)
    if @question.save
      flash[:notice] = "Question successfully posted"
      redirect_to company_questions_path
    else
      flash[:error] = "Question fields not completed"
      redirect_to :back
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
    p params
    @question = Question.find(params[:id])
    @question.status = "inactive"
    @question.save
    redirect_to :back
  end

end
