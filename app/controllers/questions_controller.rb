class QuestionsController < ApplicationController
  def index
    @questions = Question.all
    respond_with(@questions)
  end

  def show
    @question = Question.find(params[:id])
    respond_with(@question)
  end

  def new
    @question = Question.new
    respond_with(@question)
  end

  def edit
    @question = Question.find(params[:id])
  end

  def create
    @question = Question.new(params[:question])
    @question.save
    respond_with(@question)
  end

  def update
    @question = Question.find(params[:id])
    @question.update_attributes(params[:question])
    respond_with(@question)
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    respond_with(@question)
  end
end