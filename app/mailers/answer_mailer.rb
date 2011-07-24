class AnswerMailer < ActionMailer::Base
  default :from => "sistemas.roger@gmail.com"

  def question_owner_notification(answer)
    @question = answer.question
    @answer   = answer

    mail :to => "#{@question.owner.name} <#{@question.owner.email}>",
         :subject => @question.title
  end
end
