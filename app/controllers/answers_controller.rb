class AnswersController < ApplicationController

  def create
    @answer   = Answer.new(params[:answer])
    @answer.owner = current_user
    @answer.question = Question.find(params[:question_id])
    @answer.save

    respond_with(@answer, location: @answer.question)
  end

end
