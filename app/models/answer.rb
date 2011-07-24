class Answer < ActiveRecord::Base
  belongs_to :question
  belongs_to :owner,
    class_name: "User",
    foreign_key: "user_id",
    counter_cache: true

  validates_presence_of :owner, :question, :body
  validates_associated :owner, :question
end
