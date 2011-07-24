class QuestionsController < ApplicationController

  before_filter :authenticate_user!, except: [:index, :show]
  before_filter :prepare_images, :only => [:new, :create, :update, :edit]

  def index
    @questions = Question.all
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

  def prepare_images
    return unless has_image_attributes?
    params[:question][:images_attributes].reject! { |k,v| v[:file].empty? }
  end

  def has_image_attributes?
    params[:question].present? && params[:question][:images_attributes].present?
  end

end