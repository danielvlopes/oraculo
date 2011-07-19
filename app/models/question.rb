class Question < ActiveRecord::Base
  has_many :answers
  belongs_to :owner, :class_name => "User", :foreign_key => "user_id"
  captcha :nickname

  validates_presence_of :title, :body,:owner
  validates_associated :owner
end
