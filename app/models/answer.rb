class Answer < ActiveRecord::Base
  belongs_to :question

  belongs_to :owner,
    class_name: "User",
    foreign_key: "user_id",
    counter_cache: true

  validates_presence_of :owner, :question, :body
  validates_associated :owner, :question

  after_create :notify_question_owner

private

  def notify_question_owner
    if self.owner.receive_email_notifications?
      AnswerMailer.question_owner_notification(self).deliver
    end
  end

end
