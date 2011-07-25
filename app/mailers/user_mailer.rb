class UserMailer < ActionMailer::Base
  default :from => "sistemas.roger@gmail.com"

  def notify_owner_question (answer)
    @question = answer.question
		
    mail :to => "#{@question.owner.name} <#{@question.owner.email}>",
         :subject => "Pergunta respondida"
  end
end
