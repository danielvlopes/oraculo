class QuestionsController < ApplicationController

  before_filter :authenticate_user!, except: [:index, :show]

  def index
    @questions = Question.scoped
    @questions = @questions.search_title(params[:search_title]) if params[:search_title].present?
    @questions = @questions.search_author(params[:search_author]) if params[:search_author].present?
    @questions = @questions.search_date(date_select_to_date(params[:start_at]).to_date, date_select_to_date(params[:end_at]).to_date) if params[:start_at].present?
    
    respond_with(@questions) do |format|
      format.atom
    end
  end

  def show
    @question = Question.find(params[:id])
    respond_with(@question)
  end

  def new
    @question = current_user.questions.build
    respond_with(@question)
  end

  def edit
    @question = current_user.questions.find(params[:id])
  end

  def create
    @question = current_user.questions.new(params[:question])
    @question.save
    respond_with(@question)
  end

  def update
    @question = current_user.questions.find(params[:id])
    @question.update_attributes(params[:question])
    respond_with(@question)
  end

  def destroy
    @question = current_user.questions.find(params[:id])
    @question.destroy
    respond_with(@question)
  end

private

  def date_select_to_date(date_select)
    if date_select.is_a? Hash
      Date.parse("#{date_select.map{ |key, value| value }.join '-'}")
    else
      start_at
    end
  end

end