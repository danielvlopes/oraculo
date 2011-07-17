class AnswersController < ApplicationController

  def create
    @answer   = Answer.new(params[:answer])
    @answer.owner = current_user
    @answer.question = Question.find(params[:question_id])
    
    if @answer.save 
    	UserMailer.notify_owner_question(@answer).deliver
    end

    respond_with(@answer, location: @answer.question)
  end

end
