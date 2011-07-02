class AbusiveAnswersController < ApplicationController

  def create
    answer = Answer.find(params[:answer_id])
    author = User.find(params[:author_id])
    notification = AbusiveAnswerMailer.notification(answer, author)

    if notification.deliver
      flash[:notice] = "Your report was sucessfully sent to the Administration"
    else
      flash[:alert] = "Sorry, your report wasn't sent. Try again later."
    end

    redirect_to answer.question
  end

end