class Answer < ActiveRecord::Base
  belongs_to :owner, class_name: "User", foreign_key: "user_id"
  belongs_to :question

  validates_presence_of :owner, :question, :body
  validates_associated :owner, :question

end

