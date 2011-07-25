class MessageMailer < ActionMailer::Base
  default :from => "from@example.com"

  def private_message_notification(message)
    @sender = message.sender
    @receiver = message.receiver
    mail :to => @receiver.email, :subject => "New private message"
  end
end