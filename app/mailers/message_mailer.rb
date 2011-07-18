class MessageMailer < ActionMailer::Base
  default :from => "from@example.com"

  def notify_private_message_sent(sender, receiver)
    @sender = sender
    @receiver = receiver
    mail(:to => receiver.email, :subject => "New private message")
  end
end

