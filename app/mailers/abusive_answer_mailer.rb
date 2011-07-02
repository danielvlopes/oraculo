class AbusiveAnswerMailer < ActionMailer::Base
  default :from => "noreply@oraculo.com"

  def notification(answer, author)
    @answer = answer
    @author = author
    mail :to => "admin@oraculo.com"
  end

end