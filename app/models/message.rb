class Message < ActiveRecord::Base
  belongs_to :sender, :class_name => "User", :foreign_key => "sender_id"
  belongs_to :receiver, :class_name => "User", :foreign_key => "receiver_id"

  after_create :send_notification_to_receiver

  validates_presence_of :sender, :receiver, :content
  validates_associated :sender, :receiver

private

  def send_notification_to_receiver
    MessageMailer.private_message_notification(self).deliver
  end
end